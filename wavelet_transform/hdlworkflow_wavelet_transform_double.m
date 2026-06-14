%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 17:02:55 on 04/06/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\wavelet_transform\hdlworkflow_wavelet_transform_double.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'wavelet_transform_double/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','wavelet_transform_double/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('wavelet_transform_double');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('wavelet_transform_double/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'wavelet_transform_double' HDL parameters
hdlset_param('wavelet_transform_double', 'AdaptivePipelining', 'on');
hdlset_param('wavelet_transform_double', 'BalanceClockRateOutputPorts', 'on');
hdlset_param('wavelet_transform_double', 'ClockRatePipelineOutputPorts', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('wavelet_transform_double', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('wavelet_transform_double', 'HDLSubsystem', 'wavelet_transform_double/HDL_DUT');
hdlset_param('wavelet_transform_double', 'ProjectFolder', 'hdl_prj_wavelet_transform_double');
hdlset_param('wavelet_transform_double', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('wavelet_transform_double', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('wavelet_transform_double', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('wavelet_transform_double', 'SynthesisToolPackageName', 'clg400');
hdlset_param('wavelet_transform_double', 'SynthesisToolSpeedValue', '-1');
hdlset_param('wavelet_transform_double', 'TargetDirectory', 'hdl_prj_wavelet_transform_double\hdlsrc');
hdlset_param('wavelet_transform_double', 'TargetFrequency', 100);
hdlset_param('wavelet_transform_double', 'TargetLanguage', 'Verilog');
hdlset_param('wavelet_transform_double', 'UseFloatingPoint', 'on');

hdlset_param('wavelet_transform_double/HDL_DUT/wavelet_transform', 'Architecture', 'MATLAB Datapath');
% Set SubSystem HDL parameters
hdlset_param('wavelet_transform_double/HDL_DUT/wavelet_transform', 'AdaptivePipelining', 'off');
hdlset_param('wavelet_transform_double/HDL_DUT/wavelet_transform', 'ClockRatePipelining', 'off');
hdlset_param('wavelet_transform_double/HDL_DUT/wavelet_transform', 'DistributedPipelining', 'off');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_wavelet_transform_double';
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
hdlcoder.runWorkflow('wavelet_transform_double/HDL_DUT', hWC);
