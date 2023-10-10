 clf
 clc
 clear all
 hold on
 axis ([-2 2 -2 2 0 2.8])

%call LinearUR3
 r1 = LinearUR3;
 r2 = LinearCRB1100; 

%kitchen environment
 kitchen_environment = PlaceObject('Kitchen environment.ply',[0,0,0]);

%pan
    [panf,panv,pandata] = plyread('pan.ply','tri');
    panVertexCount = size(panv,1);
    panMidpoint = sum(panv)/panVertexCount;
    panVerts = panv - repmat(panMidpoint, panVertexCount, 1); 
    panVertexColors = [ones(height(panv),1)*65/255, ones(height(panv),1)*65/255,  ones(height(panv),1)*65/255];
    panMesh_h = trisurf(panf, panVerts(:,1), panVerts(:,2), panVerts(:,3) ...
                        ,'FaceVertexCData', panVertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    panplotpose = transl(-1.5,0.05,1.3);   
    panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
    panMesh_h.Vertices = panupdatedPoints(:,1:3);
    drawnow();
%pan2
    [pan2f,pan2v,pan2data] = plyread('pan2.ply','tri');
    pan2VertexCount = size(pan2v,1);
    pan2Midpoint = sum(pan2v)/pan2VertexCount;
    pan2Verts = pan2v - repmat(pan2Midpoint, pan2VertexCount, 1);  
    pan2VertexColors = [ones(height(pan2v),1)*50/255, ones(height(pan2v),1)*50/255,  ones(height(pan2v),1)*50/255];
    pan2Mesh_h = trisurf(pan2f, pan2Verts(:,1), pan2Verts(:,2), pan2Verts(:,3) ...
                        ,'FaceVertexCData', pan2VertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    pan2plotpose = transl(-1.4,-0.5,1.325)*trotz(pi/2);
    pan2updatedPoints = [pan2plotpose * [pan2Verts,ones(pan2VertexCount,1)]']';
    pan2Mesh_h.Vertices = pan2updatedPoints(:,1:3);
    drawnow();
%sauce
    [saucef,saucev,saucedata] = plyread('sauce.ply','tri');
    sauceVertexCount = size(saucev,1);
    sauceMidpoint = sum(saucev)/sauceVertexCount;
    sauceVerts = saucev - repmat(sauceMidpoint, sauceVertexCount, 1); 
    sauceVertexColors = [ones(height(saucev),1), ones(height(saucev),1),  zeros(height(saucev),1)];
    sauceMesh_h = trisurf(saucef, sauceVerts(:,1), sauceVerts(:,2), sauceVerts(:,3) ...
                        ,'FaceVertexCData', sauceVertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    sauceplotpose = transl(-1.2,-0.8,1.3);
    sauceupdatedPoints = [sauceplotpose * [sauceVerts,ones(sauceVertexCount,1)]']';
    sauceMesh_h.Vertices = sauceupdatedPoints(:,1:3);
    drawnow();

 %% INITIALISE FINGERS SERIAL LINKS 
      L1 = Link('d',0,'a',0.5,'alpha',0,'qlim',[0 pi/2]);   
      finger1 = SerialLink([L1],'name','myFinger1');

      L2 = Link('d',0,'a',-0.5,'alpha',0,'qlim',[-pi/2 0]);
      finger2 = SerialLink([L2],'name','myFinger2');

      L3 = Link('d',0,'a',0.5,'alpha',0,'qlim',[0 pi/2]);   
      finger3 = SerialLink([L3],'name','myFinger1');

      L4 = Link('d',0,'a',-0.5,'alpha',0,'qlim',[-pi/2 0]);
      finger4 = SerialLink([L4],'name','myFinger2');

%% FINGER PLY FILES
% finger 1
    [finger1f,finger1v,finger1data] = plyread('finger1.ply','tri');
    finger1VertexCount = size(finger1v,1);
    finger1Midpoint = sum(finger1v)/finger1VertexCount;
    finger1Verts = finger1v - repmat(finger1Midpoint, finger1VertexCount, 1);
    finger1VertexColors = [ones(height(finger1v),1), zeros(height(finger1v),1),  zeros(height(finger1v),1)];
    finger1Mesh_h = trisurf(finger1f, finger1Verts(:,1), finger1Verts(:,2), finger1Verts(:,3) ...
        ,'FaceVertexCData', finger1VertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    finger1plotpose = finger1.base.T;
% finger 2
    [finger2f,finger2v,finger2data] = plyread('finger2.ply','tri');
    finger2VertexCount = size(finger2v,1);
    finger2Midpoint = sum(finger2v)/finger2VertexCount;
    finger2Verts = finger2v - repmat(finger2Midpoint, finger2VertexCount, 1);
    finger2VertexColors = [ones(height(finger2v),1), zeros(height(finger2v),1),  zeros(height(finger2v),1)];
    finger2Mesh_h = trisurf(finger2f, finger2Verts(:,1), finger2Verts(:,2), finger2Verts(:,3) ...
        ,'FaceVertexCData', finger2VertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    finger2plotpose = finger1.base.T;

% finger 3
    [finger3f,finger3v,finger3data] = plyread('finger3.ply','tri');
    finger3VertexCount = size(finger3v,1);
    finger3Midpoint = sum(finger3v)/finger3VertexCount;
    finger3Verts = finger3v - repmat(finger3Midpoint, finger3VertexCount, 1);
    finger3VertexColors = [ones(height(finger3v),1), zeros(height(finger3v),1),  zeros(height(finger3v),1)];
    finger3Mesh_h = trisurf(finger3f, finger3Verts(:,1), finger3Verts(:,2), finger3Verts(:,3) ...
        ,'FaceVertexCData', finger3VertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    finger3plotpose = finger3.base.T;
% finger 4
    [finger4f,finger4v,finger4data] = plyread('finger4.ply','tri');
    finger4VertexCount = size(finger4v,1);
    finger4Midpoint = sum(finger4v)/finger4VertexCount;
    finger4Verts = finger4v - repmat(finger4Midpoint, finger4VertexCount, 1);
    finger4VertexColors = [ones(height(finger4v),1), zeros(height(finger4v),1),  zeros(height(finger4v),1)];
    finger4Mesh_h = trisurf(finger4f, finger4Verts(:,1), finger4Verts(:,2), finger4Verts(:,3) ...
        ,'FaceVertexCData', finger4VertexColors, 'EdgeColor','interp','EdgeLighting','flat');
    finger4plotpose = finger4.base.T;

%% STATE MACHINE VARIABLES
    state = 0;        %INITIALISED AS 0
    stored_state = 1; %INITIALISED AS 1 BECAUSE FIRST STORED STATE IT GOES TO IS STATE 1
    stored_i = 0;     %INITIALISED AS 0 BECAUSE FIRST ITERATION IT GOES THROUGH IT 0+1 = 1
    estop_state = 0;  %INITIALISED AS 0
    resume_state = 0; %INITIALISED AS 0

%% THE BIG WHILE LOOP
while (1)
%% STATE 0: WAITING TO BE RESUMED
  if state == 0    
     disp('STATE 0')
 
%      %FAKE ESTOP SIGNAL
%      estop_state = 0;
% 
%      %FAKE RESUME SIGNAL
%      resume_state = 1;

     state_toggle_machine()

     if estop_state == 0
        if resume_state == 1 
             state = stored_state;
             resume_state = 0;
        end
     end
  end

%% STATE 1: PICK UP PAN 1 + PAN 2
  if state == 1
      disp('STATE 1')
      stored_state = 1;
      pan2plotpose = transl(-1.4,-0.5,1.425)*trotz(pi/2);
      qCurrent1 = r1.model.getpos();
      qEnd1 = r1.model.ikine(pan2plotpose*transl(0,-0.25,0.25)*trotx(pi));
      JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 50);
      panplotpose = transl(-1.5,0.05,1.3);  
      qCurrent2 = r2.model.getpos();
      qEnd2 = r2.model.ikine(panplotpose*transl(0,0.2,0.15)*trotx(pi));
      JTrajQMatrix2 = jtraj(qCurrent2, qEnd2, 50);
      for i = (stored_i + 1):50
             state_toggle_machine()
             if state == 1
                     r1.model.animate(JTrajQMatrix1(i,:));
                     q1 = r1.model.getpos();
                     finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                     finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                     finger1plotpose = finger1.fkine(-1/50*pi/2.2).T*transl(-0.5,0,0);
                     finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
                     finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
                     finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
                     drawnow();
                     finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
                     finger2plotpose = finger2.fkine(1/50*pi/2.2).T*transl(0.5,0,0);
                     finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
                     finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
                     finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
                     drawnow();
                     finger2plotpose = finger2plotpose*transl(-0.03,0.005,0);
                     r2.model.animate(JTrajQMatrix2(i,:));
                     q2 = r2.model.getpos();
                     finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                     finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                     finger3plotpose = finger3.fkine(-i/50*pi/2.2).T*transl(-0.5,0,0);
                     finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
                     finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
                     finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
                     drawnow();
                     finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
                     finger4plotpose = finger4.fkine(i/50*pi/2.2).T*transl(0.5,0,0);
                     finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
                     finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
                     finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
                     drawnow();
                     finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
                     stored_i = i; 

%                      %FAKE ESTOP SIGNAL AT I = 10
%                      if i == 10
%                          estop_state = 1;
%                      end

                     if estop_state == 1
                         state = 0;
                     end
                     if i == 50
                         state = 2;
                         stored_i = 0;
                     end
             end
      end
  end

%% STATE 2: PICK UP PAN 1
if state == 2
     disp('STATE 2')
     stored_state = 2;
     pan2plotpose = transl(-1.4,-0.5,1.325)*trotz(pi/2);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(pan2plotpose*transl(0,-0.25,0.25)*trotx(pi));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 50);
     for i = (stored_i + 1):50
         state_toggle_machine()
         if state == 2
             r1.model.animate(JTrajQMatrix1(i,:));
             q1 = r1.model.getpos();
             finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger1plotpose = finger1.fkine(-i/50*pi/2.2).T*transl(-0.5,0,0);
             finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
             finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
             finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
             drawnow();
             finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
             finger2plotpose = finger2.fkine(i/50*pi/2.2).T*transl(0.5,0,0);
             finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
             finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
             finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
             drawnow();
             finger2plotpose = finger2plotpose*transl(-0.03,0.005,0);            
             stored_i = i;
             if estop_state == 1
                    state = 0;
             end
             if i == 50
                 state = 3;
                 stored_i = 0;
             end
         end
     end
end

%% STATE 3:  POUR MEAT FROM PAN 2 INTO PAN 1
if state == 3
    disp('STATE 3')
    stored_state = 3;
    pan2plotpose = transl(-1.4,-0.35,1.5)*trotz(pi/2);
    qCurrent1 = r1.model.getpos();
    qEnd1 = r1.model.ikine(pan2plotpose*transl(0,-0.25,0.25)*trotx(pi));
    JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
    for i = (stored_i + 1):30
          state_toggle_machine()
          if state == 3
                 r1.model.animate(JTrajQMatrix1(i,:));
                 q1 = r1.model.getpos();
                 finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger1plotpose = finger1.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
                 finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
                 finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
                 finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
                 drawnow();
                 finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
                 finger2plotpose = finger2.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
                 finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
                 finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
                 finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
                 drawnow();
                 finger2plotpose = finger2plotpose*transl(-0.03,0.005,0);
                 pan2plotpose = r1.model.fkine(q1).T*trotx(-pi)*transl(0,0.25,-0.25);
                 pan2updatedPoints = [pan2plotpose * [pan2Verts,ones(pan2VertexCount,1)]']';
                 pan2Mesh_h.Vertices = pan2updatedPoints(:,1:3);
                 drawnow();
                 stored_i = i;
                 if estop_state == 1
                     state = 0;
                 end
                 if i == 30
                     state = 4;
                     stored_i = 0;
                 end
          end
     end
end

%% STATE 4: POUR MEAT FROM PAN 2 INTO PAN 1
if state == 4
   disp('STATE 4')
   stored_state = 4;
   qCurrent1 = r1.model.getpos();  
   qEnd1 = [qCurrent1(1),qCurrent1(2),qCurrent1(3)+0.8,qCurrent1(4)+1.7,qCurrent1(5),qCurrent1(6),qCurrent1(7)];
   JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
   for i = (stored_i + 1):30
      state_toggle_machine()
      if state == 4
         r1.model.animate(JTrajQMatrix1(i,:));
         q1 = r1.model.getpos();
         finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
         finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
         finger1plotpose = finger1.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
         finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
         finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
         finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
         drawnow();
         finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
         finger2plotpose = finger2.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
         finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
         finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
         finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
         drawnow();
         finger2plotpose = finger2plotpose*transl(-0.03,0.005,0);
         pan2plotpose = r1.model.fkine(q1).T*trotx(-pi)*transl(0,0.25,-0.25);
         pan2updatedPoints = [pan2plotpose * [pan2Verts,ones(pan2VertexCount,1)]']';
         pan2Mesh_h.Vertices = pan2updatedPoints(:,1:3);
         drawnow();
         stored_i = i;
         if estop_state == 1
             state = 0;
         end
         if i == 30
             state = 5;
             stored_i = 0;
         end
      end
   end
end

%% STATE 5: POUR MEAT FROM PAN 2 INTO PAN 1
if state == 5
     disp('STATE 5')
     stored_state = 5;
     pan2plotpose = transl(-1.4,-0.5,1.325)*trotz(pi/2);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(pan2plotpose*transl(0,-0.25,0.25)*trotx(pi));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
     panplotpose = transl(-1.5,0.05,1.4)*trotx(-pi/8);
     qCurrent2 = r2.model.getpos();
     qEnd2 = r2.model.ikine(panplotpose*transl(0,0.2,0.15)*trotx(pi));
     JTrajQMatrix2 = jtraj(qCurrent2, qEnd2, 5);
     j = 5;
     for i = (stored_i + 1):30
           state_toggle_machine()
           if state == 5
                 r1.model.animate(JTrajQMatrix1(i,:));
                 q1 = r1.model.getpos();
                 finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger1plotpose = finger1.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
                 finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
                 finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
                 finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
                 drawnow();
                 finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
                 finger2plotpose = finger2.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
                 finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
                 finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
                 finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
                 drawnow();         
                 pan2plotpose = r1.model.fkine(q1).T*trotx(-pi)*transl(0,0.25,-0.25);
                 pan2updatedPoints = [pan2plotpose * [pan2Verts,ones(pan2VertexCount,1)]']';
                 pan2Mesh_h.Vertices = pan2updatedPoints(:,1:3);
                 drawnow();
                 if i < 6
                     r2.model.animate(JTrajQMatrix2(i,:));
                 end
                 if (i > 5 && i < 11) || (i > 15 && i < 21) || (i > 25 && i < 31)               
                     r2.model.animate(JTrajQMatrix2(j,:));
                     j = j-1;
                 end
                 if (i > 10 && i < 16) || (i > 20 && i < 26) 
                     j = j+1;
                     r2.model.animate(JTrajQMatrix2(j,:));
                 end
                 q2 = r2.model.getpos();
                 finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                 finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                 finger3plotpose = finger3.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
                 finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
                 finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
                 finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
                 drawnow();
                 finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
                 finger4plotpose = finger4.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
                 finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
                 finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
                 finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
                 drawnow();
                 finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
                 panplotpose = r2.model.fkine(q2).T*trotx(-pi)*transl(0,-0.20,-0.15);
                 panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
                 panMesh_h.Vertices = panupdatedPoints(:,1:3);
                 drawnow();
                 stored_i = i;
                 if estop_state == 1
                     state = 0;
                 end
                 if i == 30
                     state = 6;
                     stored_i = 0;
                 end
            end
     end
end
%% STATE 6: POUR SAUCE INTO PAN 1
if state == 6
     disp('STATE 6')
     stored_state = 6;
     sauceplotpose = transl(-1.2,-0.8,1.3);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(sauceplotpose*transl(-0.1,0,0.15)*troty(pi/2)*trotz(pi/2));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
     j = 5;
     m = 30;
     for i = (stored_i + 1):30
         state_toggle_machine()
         if state == 6
                 r1.model.animate(JTrajQMatrix1(i,:));
                 q1 = r1.model.getpos();
                 finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
                 finger1plotpose = finger1.fkine(-m/30*pi/2.2).T*transl(-0.5,0,0);
                 finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
                 finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
                 finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
                 drawnow();
                 finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
                 finger2plotpose = finger2.fkine(m/30*pi/2.2).T*transl(0.5,0,0);
                 finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
                 finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
                 finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
                 drawnow();
                 m = m-1;
                 if i < 6
                     r2.model.animate(JTrajQMatrix2(i,:));
                 end
                 if (i > 5 && i < 11) || (i > 15 && i < 21) || (i > 25 && i < 31)     
                     r2.model.animate(JTrajQMatrix2(j,:));
                     j = j-1;
                 end
                 if (i > 10 && i < 16) || (i > 20 && i < 26) 
                     j = j+1;
                     r2.model.animate(JTrajQMatrix2(j,:));
                 end
                 q2 = r2.model.getpos();
                 finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                 finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
                 finger3plotpose = finger3.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
                 finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
                 finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
                 finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
                 drawnow();
                 finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
                 finger4plotpose = finger4.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
                 finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
                 finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
                 finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
                 drawnow();
                 finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
                 panplotpose = r2.model.fkine(q2).T*trotx(-pi)*transl(0,-0.20,-0.15);
                 panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
                 panMesh_h.Vertices = panupdatedPoints(:,1:3);
                 drawnow();
                 stored_i = i;
                 if estop_state == 1
                     state = 0;
                 end
                 if i == 30
                     state = 7;
                     stored_i = 0;
                 end
         end
     end
end

%% STATE 7: POUR SAUCE INTO PAN 1
if state == 7
     disp('STATE 7')
     stored_state = 7;
     sauceplotpose = transl(-1.2,-0.8,1.3);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(sauceplotpose*transl(-0.1,0,0.01)*troty(pi/2)*trotz(pi/2));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
     j = 5;
     for i = (stored_i + 1):30
       state_toggle_machine()
       if state == 7
         r1.model.animate(JTrajQMatrix1(i,:));
         q1 = r1.model.getpos();
         finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
         finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
         finger1plotpose = finger1.fkine(-i/30*pi/2.2).T*transl(-0.5,0,0);
         finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
         finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
         finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
         drawnow();
         finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
         finger2plotpose = finger2.fkine(i/30*pi/2.2).T*transl(0.5,0,0);
         finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
         finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
         finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
         drawnow();
         if i < 6
             r2.model.animate(JTrajQMatrix2(i,:));
         end
         if (i > 5 && i < 11) || (i > 15 && i < 21) || (i > 25 && i < 31) || (i > 35 && i < 41) || (i > 45 && i < 51)               
             r2.model.animate(JTrajQMatrix2(j,:));
             j = j-1;
         end
         if (i > 10 && i < 16) || (i > 20 && i < 26) || (i > 30 && i < 36)|| (i > 40 && i < 46)
             j = j+1;
             r2.model.animate(JTrajQMatrix2(j,:));
         end
             q2 = r2.model.getpos();
             finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger3plotpose = finger3.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
             finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
             finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
             finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
             drawnow();
             finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
             finger4plotpose = finger4.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
             finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
             finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
             finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
             drawnow();
             finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
             panplotpose = r2.model.fkine(q2).T*trotx(-pi)*transl(0,-0.20,-0.15);
             panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
             panMesh_h.Vertices = panupdatedPoints(:,1:3);
             drawnow();
             stored_i = i;
             if estop_state == 1
                 state = 0;
             end
             if i == 30
                 state = 8;
                 stored_i = 0;
             end
        end
     end 
end

%% STATE 8: POUR SAUCE INTO PAN 1
if state == 8
     disp('STATE 8')
     stored_state = 8;
     sauceplotpose = transl(-1.3,0,1.6)*troty(-pi/2)*trotz(pi/2);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(sauceplotpose*transl(-0.1,0,0.01)*troty(pi/2)*trotz(pi/2));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
     j = 5;
     for i = (stored_i + 1):30
         state_toggle_machine()
         if state == 8
             r1.model.animate(JTrajQMatrix1(i,:));
             q1 = r1.model.getpos();
             finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger1plotpose = finger1.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
             finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
             finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
             finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
             drawnow();
             finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
             finger2plotpose = finger2.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
             finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
             finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
             finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
             drawnow();
             sauceplotpose = r1.model.fkine(q1).T*trotz(-pi/2)*troty(-pi/2)*transl(0.1,0,-0.01);
             sauceupdatedPoints = [sauceplotpose * [sauceVerts,ones(sauceVertexCount,1)]']';
             sauceMesh_h.Vertices = sauceupdatedPoints(:,1:3);
             drawnow();
             if i < 6
                 r2.model.animate(JTrajQMatrix2(i,:));
             end
             if (i > 5 && i < 11) || (i > 15 && i < 21) || (i > 25 && i < 31) || (i > 35 && i < 41) || (i > 45 && i < 51)               
                 r2.model.animate(JTrajQMatrix2(j,:));
                 j = j-1;
             end
             if (i > 10 && i < 16) || (i > 20 && i < 26) || (i > 30 && i < 36)|| (i > 40 && i < 46)
                 j = j+1;
                 r2.model.animate(JTrajQMatrix2(j,:));
             end
             q2 = r2.model.getpos();
             finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger3plotpose = finger3.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
             finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
             finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
             finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
             drawnow();
             finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
             finger4plotpose = finger4.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
             finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
             finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
             finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
             drawnow();
             finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
             panplotpose = r2.model.fkine(q2).T*trotx(-pi)*transl(0,-0.20,-0.15);
             panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
             panMesh_h.Vertices = panupdatedPoints(:,1:3);
             drawnow();
             stored_i = i;
             if estop_state == 1
                 state = 0;
             end
             if i == 30
                 state = 9;
                 stored_i = 0;
             end
         end
     end
end

%% STATE 9: POUR SAUCE INTO PAN 1
if state == 9
     disp('STATE 9')
     stored_state = 9;
     sauceplotpose = transl(-1.2,-0.8,1.3);
     qCurrent1 = r1.model.getpos();
     qEnd1 = r1.model.ikine(sauceplotpose*transl(-0.1,0,0.01)*troty(pi/2)*trotz(pi/2));
     JTrajQMatrix1 = jtraj(qCurrent1, qEnd1, 30);
     j = 5;
     for i = (stored_i + 1):30
         state_toggle_machine()
         if state == 9
             r1.model.animate(JTrajQMatrix1(i,:));
             q1 = r1.model.getpos();
             finger1.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger2.base = r1.model.fkine(q1).T*transl(0,0,0.023)*trotx(pi/2);
             finger1plotpose = finger1.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
             finger1plotpose = finger1plotpose*transl(-0.03,-0.005,0);
             finger1updatedPoints = [finger1plotpose * [finger1Verts,ones(finger1VertexCount,1)]']';
             finger1Mesh_h.Vertices = finger1updatedPoints(:,1:3);
             drawnow();
             finger1plotpose = finger1plotpose*transl(0.03,0.005,0);
             finger2plotpose = finger2.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
             finger2plotpose = finger2plotpose*transl(0.03,-0.005,0);
             finger2updatedPoints = [finger2plotpose * [finger2Verts,ones(finger2VertexCount,1)]']';
             finger2Mesh_h.Vertices = finger2updatedPoints(:,1:3);
             drawnow();
             sauceplotpose = r1.model.fkine(q1).T*trotz(-pi/2)*troty(-pi/2)*transl(0.1,0,-0.01);
             sauceupdatedPoints = [sauceplotpose * [sauceVerts,ones(sauceVertexCount,1)]']';
             sauceMesh_h.Vertices = sauceupdatedPoints(:,1:3);
             drawnow();
             if i < 6
                 r2.model.animate(JTrajQMatrix2(i,:));
             end
             if (i > 5 && i < 11) || (i > 15 && i < 21) || (i > 25 && i < 31) || (i > 35 && i < 41) || (i > 45 && i < 51)               
                 r2.model.animate(JTrajQMatrix2(j,:));
                 j = j-1;
             end
             if (i > 10 && i < 16) || (i > 20 && i < 26) || (i > 30 && i < 36)|| (i > 40 && i < 46)
                 j = j+1;
                 r2.model.animate(JTrajQMatrix2(j,:));
             end
             q2 = r2.model.getpos();
             finger3.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger4.base = r2.model.fkine(q2).T*transl(0,0,0.023)*trotx(pi/2);
             finger3plotpose = finger3.fkine(-30/30*pi/2.2).T*transl(-0.5,0,0);
             finger3plotpose = finger3plotpose*transl(-0.03,-0.005,0);
             finger3updatedPoints = [finger3plotpose * [finger3Verts,ones(finger3VertexCount,1)]']';
             finger3Mesh_h.Vertices = finger3updatedPoints(:,1:3);
             drawnow();
             finger3plotpose = finger3plotpose*transl(0.03,0.005,0);
             finger4plotpose = finger4.fkine(30/30*pi/2.2).T*transl(0.5,0,0);
             finger4plotpose = finger4plotpose*transl(0.03,-0.005,0);
             finger4updatedPoints = [finger4plotpose * [finger4Verts,ones(finger4VertexCount,1)]']';
             finger4Mesh_h.Vertices = finger4updatedPoints(:,1:3);
             drawnow();
             finger4plotpose = finger4plotpose*transl(-0.03,0.005,0);
             panplotpose = r2.model.fkine(q2).T*trotx(-pi)*transl(0,-0.20,-0.15);
             panupdatedPoints = [panplotpose * [panVerts,ones(panVertexCount,1)]']';
             panMesh_h.Vertices = panupdatedPoints(:,1:3);
             drawnow();
             stored_i = i;
             if estop_state == 1
                 state = 0;
             end
             if i == 30
                 state = 0;
                 stored_state = 1;
                 stored_i = 0;
             end
         end
     end
end
end

%% STATE TOGGLE MACHINE
% function state_toggle_machine()
%     if 'estop is pressed'
%         if estop_state == 0
%             estop_state = 1;
%         elseif estop_state = 1
%             estop_state = 0;
%         end    
%     end 
%     if 'resume button is pressed'
%         resume_state = 1;
%     end
% end

