classdef GetCloudResponse < robotics.ros.Message
    %GetCloudResponse MATLAB implementation of octomap_pa_msgs/GetCloudResponse
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2020 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'octomap_pa_msgs/GetCloudResponse' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '56bd5799f974ba458f6234b0a0a74f0f' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        OctomapPaMsgsConfigClass = robotics.ros.msg.internal.MessageFactory.getClassForType('octomap_pa_msgs/Config') % Dispatch to MATLAB class for message type octomap_pa_msgs/Config
        SensorMsgsPointCloud2Class = robotics.ros.msg.internal.MessageFactory.getClassForType('sensor_msgs/PointCloud2') % Dispatch to MATLAB class for message type sensor_msgs/PointCloud2
    end
    
    properties (Dependent)
        Cloud
        Config
    end
    
    properties (Access = protected)
        Cache = struct('Cloud', [], 'Config', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Cloud', 'Config'} % List of non-constant message properties
        ROSPropertyList = {'cloud', 'config'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = GetCloudResponse(msg)
            %GetCloudResponse Construct the message object GetCloudResponse
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
            validateattributes(cloud, {obj.SensorMsgsPointCloud2Class}, {'nonempty', 'scalar'}, 'GetCloudResponse', 'Cloud');
            
            obj.JavaMessage.setCloud(cloud.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Cloud)
                obj.Cache.Cloud.setJavaObject(cloud.getJavaObject);
            end
        end
        
        function config = get.Config(obj)
            %get.Config Get the value for property Config
            if isempty(obj.Cache.Config)
                obj.Cache.Config = feval(obj.OctomapPaMsgsConfigClass, obj.JavaMessage.getConfig);
            end
            config = obj.Cache.Config;
        end
        
        function set.Config(obj, config)
            %set.Config Set the value for property Config
            validateattributes(config, {obj.OctomapPaMsgsConfigClass}, {'nonempty', 'scalar'}, 'GetCloudResponse', 'Config');
            
            obj.JavaMessage.setConfig(config.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Config)
                obj.Cache.Config.setJavaObject(config.getJavaObject);
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Cloud = [];
            obj.Cache.Config = [];
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
            cpObj.Config = copy(obj.Config);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Cloud = feval([obj.SensorMsgsPointCloud2Class '.loadobj'], strObj.Cloud);
            obj.Config = feval([obj.OctomapPaMsgsConfigClass '.loadobj'], strObj.Config);
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
            strObj.Config = saveobj(obj.Config);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.octomap_pa_msgs.GetCloudResponse.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.octomap_pa_msgs.GetCloudResponse;
            obj.reload(strObj);
        end
    end
end
