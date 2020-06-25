classdef AddCloudTfRequest < robotics.ros.Message
    %AddCloudTfRequest MATLAB implementation of octomap_pa_msgs/AddCloudTfRequest
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'octomap_pa_msgs/AddCloudTfRequest' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '115a612aafd6e7cbe0e86f4286714763' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsTransformClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Transform') % Dispatch to MATLAB class for message type geometry_msgs/Transform
        SensorMsgsPointCloud2Class = robotics.ros.msg.internal.MessageFactory.getClassForType('sensor_msgs/PointCloud2') % Dispatch to MATLAB class for message type sensor_msgs/PointCloud2
    end
    
    properties (Dependent)
        Cloud
        Transform
    end
    
    properties (Access = protected)
        Cache = struct('Cloud', [], 'Transform', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Cloud', 'Transform'} % List of non-constant message properties
        ROSPropertyList = {'cloud', 'transform'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = AddCloudTfRequest(msg)
            %AddCloudTfRequest Construct the message object AddCloudTfRequest
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function cloud = get.Cloud(obj)
            %get.Cloud Get the value for property Cloud
            if isempty(obj.Cache.Cloud)
                obj.Cache.Cloud = feval(obj.SensorMsgsPointCloud2Class, obj.JavaMessage.getCloud);
            end
            cloud = obj.Cache.Cloud;
        end
        
        function set.Cloud(obj, cloud)
            %set.Cloud Set the value for property Cloud
            validateattributes(cloud, {obj.SensorMsgsPointCloud2Class}, {'nonempty', 'scalar'}, 'AddCloudTfRequest', 'Cloud');
            
            obj.JavaMessage.setCloud(cloud.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Cloud)
                obj.Cache.Cloud.setJavaObject(cloud.getJavaObject);
            end
        end
        
        function transform = get.Transform(obj)
            %get.Transform Get the value for property Transform
            if isempty(obj.Cache.Transform)
                obj.Cache.Transform = feval(obj.GeometryMsgsTransformClass, obj.JavaMessage.getTransform);
            end
            transform = obj.Cache.Transform;
        end
        
        function set.Transform(obj, transform)
            %set.Transform Set the value for property Transform
            validateattributes(transform, {obj.GeometryMsgsTransformClass}, {'nonempty', 'scalar'}, 'AddCloudTfRequest', 'Transform');
            
            obj.JavaMessage.setTransform(transform.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Transform)
                obj.Cache.Transform.setJavaObject(transform.getJavaObject);
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Cloud = [];
            obj.Cache.Transform = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.Cloud = copy(obj.Cloud);
            cpObj.Transform = copy(obj.Transform);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Cloud = feval([obj.SensorMsgsPointCloud2Class '.loadobj'], strObj.Cloud);
            obj.Transform = feval([obj.GeometryMsgsTransformClass '.loadobj'], strObj.Transform);
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Cloud = saveobj(obj.Cloud);
            strObj.Transform = saveobj(obj.Transform);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.octomap_pa_msgs.AddCloudTfRequest.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.octomap_pa_msgs.AddCloudTfRequest;
            obj.reload(strObj);
        end
    end
end
