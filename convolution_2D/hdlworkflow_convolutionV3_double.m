%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 16:07:33 on 27/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\convolution_2D\hdlworkflow_convolutionV3_double.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'convolution_2D_v3/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','convolution_2D_v3/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('convolution_2D_v3');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('convolution_2D_v3/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'convolution_2D_v3' HDL parameters
hdlset_param('convolution_2D_v3', 'AdaptivePipelining', 'on');
hdlset_param('convolution_2D_v3', 'BalanceClockRateOutputPorts', 'on');
hdlset_param('convolution_2D_v3', 'ClockRatePipelineOutputPorts', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('convolution_2D_v3', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('convolution_2D_v3', 'HDLSubsystem', 'convolution_2D_v3/HDL_DUT');
hdlset_param('convolution_2D_v3', 'ProjectFolder', 'hdl_prj_convolution_2D_v3_double');
hdlset_param('convolution_2D_v3', 'ShareAdders', 'on');
hdlset_param('convolution_2D_v3', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('convolution_2D_v3', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('convolution_2D_v3', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('convolution_2D_v3', 'SynthesisToolPackageName', 'clg400');
hdlset_param('convolution_2D_v3', 'SynthesisToolSpeedValue', '-1');
hdlset_param('convolution_2D_v3', 'TargetDirectory', 'hdl_prj_convolution_2D_v3_double\hdlsrc');
hdlset_param('convolution_2D_v3', 'TargetFrequency', 100);
hdlset_param('convolution_2D_v3', 'TargetLanguage', 'Verilog');
hdlset_param('convolution_2D_v3', 'UseFloatingPoint', 'on');

hdlset_param('convolution_2D_v3/HDL_DUT/Convolution', 'Architecture', 'MATLAB Datapath');
% Set SubSystem HDL parameters
hdlset_param('convolution_2D_v3/HDL_DUT/Convolution', 'AdaptivePipelining', 'off');
hdlset_param('convolution_2D_v3/HDL_DUT/Convolution', 'ClockRatePipelining', 'off');
hdlset_param('convolution_2D_v3/HDL_DUT/Convolution', 'DistributedPipelining', 'off');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_convolution_2D_v3_double';
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
hdlcoder.runWorkflow('convolution_2D_v3/HDL_DUT', hWC);
