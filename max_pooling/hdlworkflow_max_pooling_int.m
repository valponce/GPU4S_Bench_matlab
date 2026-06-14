%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 14:56:40 on 21/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\max_pooling\hdlworkflow_max_pooling_int.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'max_pooling/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','max_pooling/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('max_pooling');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('max_pooling/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'max_pooling' HDL parameters
hdlset_param('max_pooling', 'AdaptivePipelining', 'on');
hdlset_param('max_pooling', 'BalanceClockRateOutputPorts', 'on');
hdlset_param('max_pooling', 'ClockRatePipelineOutputPorts', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('max_pooling', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('max_pooling', 'HDLSubsystem', 'max_pooling/HDL_DUT');
hdlset_param('max_pooling', 'ProjectFolder', 'hdl_prj_max_pooling_int');
hdlset_param('max_pooling', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('max_pooling', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('max_pooling', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('max_pooling', 'SynthesisToolPackageName', 'clg400');
hdlset_param('max_pooling', 'SynthesisToolSpeedValue', '-1');
hdlset_param('max_pooling', 'TargetDirectory', 'hdl_prj_max_pooling_int\hdlsrc');
hdlset_param('max_pooling', 'TargetFrequency', 100);
hdlset_param('max_pooling', 'TargetLanguage', 'Verilog');
hdlset_param('max_pooling', 'UseFloatingPoint', 'on');

hdlset_param('max_pooling/HDL_DUT/max_pooling', 'Architecture', 'MATLAB Datapath');
% Set SubSystem HDL parameters
hdlset_param('max_pooling/HDL_DUT/max_pooling', 'AdaptivePipelining', 'off');
hdlset_param('max_pooling/HDL_DUT/max_pooling', 'ClockRatePipelining', 'off');
hdlset_param('max_pooling/HDL_DUT/max_pooling', 'DistributedPipelining', 'off');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_max_pooling_int';
hWC.AllowUnsupportedToolVersion = true;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndTestbench = true;
hWC.RunTaskVerifyWithHDLCosimulation = false;
hWC.RunTaskCreateProject = true;
hWC.RunTaskRunSynthesis = true;
hWC.RunTaskRunImplementation = false;
hWC.RunTaskAnnotateModelWithSynthesisResult = true;

% Set properties related to 'RunTaskGenerateRTLCodeAndTestbench' Task
hWC.GenerateRTLCode = true;
hWC.GenerateTestbench = false;
hWC.GenerateValidationModel = false;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';

% Set properties related to 'RunTaskRunSynthesis' Task
hWC.SkipPreRouteTimingAnalysis = false;

% Set properties related to 'RunTaskRunImplementation' Task
hWC.IgnorePlaceAndRouteErrors = false;

% Set properties related to 'RunTaskAnnotateModelWithSynthesisResult' Task
hWC.CriticalPathSource = 'pre-route';
hWC.CriticalPathNumber =  1;
hWC.ShowAllPaths = false;
hWC.ShowDelayData = true;
hWC.ShowUniquePaths = false;
hWC.ShowEndsOnly = false;
hWC.AnnotateModel = 'generated';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('max_pooling/HDL_DUT', hWC);
