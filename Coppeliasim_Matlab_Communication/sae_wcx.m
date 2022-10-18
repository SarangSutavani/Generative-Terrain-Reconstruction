clc;clear;close all

sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19997,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server')

    % get handle
    [ptcCode, ptcHandel] = sim.simxGetObjectHandle(clientID, '/VelodyneHDL64ES2/ptCloud', sim.simx_opmode_oneshot_wait);
    %     read_code = sim.simxReadVisionSensor(clientID, ptcHandel, sim.simx_opmode_streaming);

    %     t=clock;C:\Users\jmoyala\Documents\Joseph AUE8930 Codes and
    %     Assignments\Final project\Coppeliasim Matlab Communication\O3

    %     startTime=t(6);
    %     currentTime=t(6);
    %     diff = currentTime-startTime;
    sim.simxCallScriptFunction(clientID, '/VelodyneHDL64ES2', 1, 'getPoints',[],[],[],[],sim.simx_opmode_streaming); % Initialize streaming
    %     while (diff < 10)
    %     fprintf('diff: %0.2f\n', diff)
    [returnCode,pointCloudint,pointCloudfloat,pointCloudstr,buffer] = sim.simxCallScriptFunction(clientID, '/VelodyneHDL64ES2', 1, 'getPoints',[],[],[],[],sim.simx_opmode_blocking);
    %returnCode

    %     t = clock;
    %     currentTime=t(6);
    %     diff = currentTime-startTime;
    %     end

    sim.simxFinish(-1);

else
    disp('Failed connecting to remote API server');
end

sim.delete(); % call the destructor!

returnCode
%% Point cloud plotting
if (~returnCode)
    ptc3D = reshape(pointCloudfloat,3,[]);

%    sp=scatter3(ptc3D(1,:),ptc3D(2,:),ptc3D(3,:),0.5,ptc3D(3,:));
%     scatter(ptc3D(1,:),ptc3D(2,:),0.5)
%     size(ptc3D)
%     scatter(ptc3D(1,:),ptc3D(2,:),0.5,ptc3D(3,:))
%     %     sp.SizeData = 100;
%     axis off

end
%% Points within 10m X 10m region
if (~returnCode)
    terrain_x_size = 25; % Parameter
    terrain_y_size = 25; % Parameter

    ptc3D_close = ptc3D(:,abs(ptc3D(1,:))<terrain_x_size/2);
    ptc3D_close = ptc3D_close(:,abs(ptc3D_close(2,:))<terrain_y_size/2);
    %     size(ptc3D_close)

    % figure(1)
    % scatter(ptc3D_close(1,:),ptc3D_close(2,:),0.5,ptc3D_close(3,:))
    % axis off

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    height_min = min(ptc3D_close(3,:));
    height_max = max(ptc3D_close(3,:));

    height_diff = height_max - height_min;

    if(height_diff>0.1)
        row_min = -terrain_x_size/2;%min(ptc3D_close(1,:));
        row_max = terrain_x_size/2;%max(ptc3D_close(1,:));

        column_min = -terrain_y_size/2;%min(ptc3D_close(2,:));
        column_max = terrain_y_size/2;%max(ptc3D_close(2,:));

        c = clock;
        str1 = string(c);
        str = str1(1)+'_'+str1(2)+'_'+str1(3)+'_'+str1(4)+'_'+str1(5)+'_'+str1(6);
        %

        img_size=250; % Parameter
        no_rows = img_size;%size(img,1);
        no_columns = img_size;%size(img,2);

        row_start = row_min;
        row_end = row_max;
        column_start = column_min;
        column_end = column_max;

        row_edges = linspace(row_start, row_end, no_rows);
        column_edges = linspace(column_start, column_end, no_columns);

        row_index = discretize(ptc3D_close(1,:),row_edges);
        column_index = discretize(ptc3D_close(2,:),column_edges);

        img1 = zeros(no_rows,no_columns);
        mean_index = zeros(no_rows,no_columns);
        mask = zeros(no_rows,no_columns);

        for i = 1:size(ptc3D_close,2)
            %         i
            img1(row_index(1,i),column_index(1,i)) = img1(row_index(1,i),column_index(1,i)) + ptc3D_close(3,i);
            mean_index(row_index(1,i),column_index(1,i)) = mean_index(row_index(1,i),column_index(1,i)) + 1;
            mask(row_index(1,i),column_index(1,i)) = 1;
        end


        mask =logical(mask);

        for i = 1:no_rows
            for j = 1:no_columns

                if mean_index(i,j) ~= 0

                    img1(i,j) = img1(i,j)/mean_index(i,j);

                end

            end
        end
        img1 = rot90(img1);
        mask = rot90(mask);



        img_scale_factor=1.5; % Parameter
        img2 = (img1*255)/img_scale_factor;

        img2 = uint8(img2);

        mask = uint8(mask*255);

        % Parameters
        environment = "obstacles_only/"; % Note: all has obstacles + octaves
        subEnvironment = "circle/";
        subSubEnvironment = "";
        trainOrTest = "train data/";
        d = pwd + "/../Generative-Terrain-Reconstruction" + environment + "heightmaps/" + subEnvironment + subSubEnvironment + trainOrTest;
        filePath = d + "forMatlab.txt";
        text = readlines(filePath);

        imwrite(img2,d + "labels/" + "L_" + text(1));
        imwrite(mask,d + "masks/" + "M_" + text(1));
        fprintf("\n\nDone\n")
        fprintf("Masks and labels %s created successfully!\n", text(1));
        fprintf("Saved in path: \n %s\n%s", d+"labels/L_"+text(1),...
            d+"masks/M_"+text(1));
    else
        fprintf("\n\n No Terrain!!!\n")
    end
else
    fprintf("\n\nError!!!\n")
end