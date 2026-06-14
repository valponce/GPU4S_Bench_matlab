%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 22:22:20 on 14/06/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\correlation\hdlworkflow_int.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'correlation/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','correlation/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('correlation');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('correlation/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'correlation' HDL parameters
hdlset_param('correlation', 'AdaptivePipelining', 'on');
hdlset_param('correlation', 'BalanceClockRateOutputPorts', 'on');
hdlset_param('correlation', 'ClockRatePipelineOutputPorts', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('correlation', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('correlation', 'HDLSubsystem', 'correlation/HDL_DUT');
hdlset_param('correlation', 'ProjectFolder', 'hdl_prj_correlation1');
hdlset_param('correlation', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('correlation', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('correlation', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('correlation', 'SynthesisToolPackageName', 'clg400');
hdlset_param('correlation', 'SynthesisToolSpeedValue', '-1');
hdlset_param('correlation', 'TargetDirectory', 'hdl_prj_correlation1\hdlsrc');
hdlset_param('correlation', 'TargetFrequency', 100);
hdlset_param('correlation', 'TargetLanguage', 'Verilog');
hdlset_param('correlation', 'UseFloatingPoint', 'on');

hdlset_param('correlation/HDL_DUT/Mean', 'Architecture', 'MATLAB Datapath');
% Set SubSystem HDL parameters
hdlset_param('correlation/HDL_DUT/Mean', 'AdaptivePipelining', 'off');
hdlset_param('correlation/HDL_DUT/Mean', 'ClockRatePipelining', 'off');
hdlset_param('correlation/HDL_DUT/Mean', 'DistributedPipelining', 'off');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_correlation1';
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
hdlcoder.runWorkflow('correlation/HDL_DUT', hWC);
