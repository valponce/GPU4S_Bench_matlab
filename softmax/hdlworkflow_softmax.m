%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 12:32:50 on 21/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\softmax\hdlworkflow_softmax.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'softmax_int/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','softmax_int/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('softmax_int');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('softmax_int/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'softmax_int' HDL parameters
hdlset_param('softmax_int', 'AdaptivePipelining', 'on');
hdlset_param('softmax_int', 'BalanceClockRateOutputPorts', 'on');
hdlset_param('softmax_int', 'ClockRatePipelineOutputPorts', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('softmax_int', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('softmax_int', 'HDLSubsystem', 'softmax_int/HDL_DUT');
hdlset_param('softmax_int', 'ProjectFolder', 'hdl_prj_softmax');
hdlset_param('softmax_int', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('softmax_int', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('softmax_int', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('softmax_int', 'SynthesisToolPackageName', 'clg400');
hdlset_param('softmax_int', 'SynthesisToolSpeedValue', '-1');
hdlset_param('softmax_int', 'TargetDirectory', 'hdl_prj_softmax\hdlsrc');
hdlset_param('softmax_int', 'TargetFrequency', 100);
hdlset_param('softmax_int', 'TargetLanguage', 'Verilog');
hdlset_param('softmax_int', 'UseFloatingPoint', 'on');

hdlset_param('softmax_int/HDL_DUT/Softmax', 'Architecture', 'MATLAB Datapath');
% Set SubSystem HDL parameters
hdlset_param('softmax_int/HDL_DUT/Softmax', 'AdaptivePipelining', 'off');
hdlset_param('softmax_int/HDL_DUT/Softmax', 'ClockRatePipelining', 'off');
hdlset_param('softmax_int/HDL_DUT/Softmax', 'DistributedPipelining', 'off');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_softmax';
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
hdlcoder.runWorkflow('softmax_int/HDL_DUT', hWC);
