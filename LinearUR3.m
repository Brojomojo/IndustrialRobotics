classdef LinearUR3 < RobotBaseClass
    %% LinearUR3 UR3 on a non-standard linear rail

    properties(Access = public)              
        plyFileNameStem = 'LinearUR3';
    end

    
    methods
%% Define robot Function 
        function self = LinearUR3(baseTr)
			self.CreateModel();
            if nargin < 1			
% 				baseTr = eye(4)*transl(-0.4,0,0.73); %%assignment1	
                baseTr = eye(4)*transl(-1.5,1.5,2.05)*trotz(pi/2)*trotx(pi); %%assignment2
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);           
            self.PlotAndColourRobot();         
        end

%% Create the robot model
        function CreateModel(self)           

            % Create the UR3 model mounted on a linear rail
            link(1) = Link([pi     0       0       pi/2    1]);% DONE - PRISMATIC LINK
            link(2) = Link([0      0.2226  0       -pi/2   0]);% DONE - HORIZONTAL LINK 
            link(3) = Link([0      0.120   0.244   -pi     0]);% DONE - HORIZONTAL LINK
            link(4) = Link([0      0.093   0.213   pi      0]);% DONE - HORIZONTAL LINK
            link(5) = Link([0      0.083   0       -pi/2   0]);% DONE - VERTICAL LINK
            link(6) = Link([0      0.083   0       -pi/2   0]);% DONE - HORIZONTAL LINK
            link(7) = Link([0      0.077       0       0       0]);% DONE - HORIZONTAL LINK
           
            link(1).offset = 0;
            link(2).offset = pi/2;
            link(3).offset = -pi/2; 
            link(4).offset = 0;
            link(5).offset = -pi/2; 
            link(6).offset = pi;           
            link(7).offset = 0;

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