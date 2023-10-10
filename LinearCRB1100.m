classdef LinearCRB1100 < RobotBaseClass
    %% CRB1100 on a non-standard linear rail

    properties(Access = public)              
        plyFileNameStem = 'LinearCRB1100';
    end

    
    methods
%% Define robot Function 
        function self = LinearCRB1100(baseTr)
			self.CreateModel();
            if nargin < 1			
%                 baseTr = eye(4); 
                baseTr = eye(4)*transl(-1.5,1.5,2.05)*trotz(pi/2)*trotx(pi); %%assignment2
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);           
            self.PlotAndColourRobot();         
        end

%% Create the robot model
        function CreateModel(self)           

            % Create the UR3 model mounted on a linear rail
            link(1) = Link([pi     0       0       pi/2    1]);% DONE - PRISMATIC LINK
            link(2) = Link([0      0.4     0       pi/2    0]);% DONE - HORIZONTAL LINK 
            link(3) = Link([0      0       0.227  0       0]);% DONE - HORIZONTAL LINK
            link(4) = Link([0      0       0       pi/2    0]);% DONE - HORIZONTAL LINK
            link(5) = Link([0      0.25    0       pi/2    0]);% DONE - VERTICAL LINK
            link(6) = Link([0      0       0       pi/2    0]);% DONE - HORIZONTAL LINK
            link(7) = Link([0      0.06       0       0       0]);% DONE - HORIZONTAL LINK
           
            link(1).offset = 0.2;
            link(2).offset = 0;
            link(3).offset = pi/2; 
            link(4).offset = pi;
            link(5).offset = 0; 
            link(6).offset = pi;          
            link(7).offset = pi/2;

            % Incorporate joint limits
            link(1).qlim = [0 2];
            link(2).qlim = [-180 180]*pi/180;
            link(3).qlim = [-180 180]*pi/180;
            link(4).qlim = [-180 180]*pi/180;
            link(5).qlim = [-180 180]*pi/180;
            link(6).qlim = [-180 180]*pi/180;
            link(7).qlim = [-180 180]*pi/180;

            self.model = SerialLink(link,'name',self.name);

        end

     
    end
end