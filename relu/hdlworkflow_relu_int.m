%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 13:16:18 on 10/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\relu\hdlworkflow_relu_int.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'relu_int/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','relu_int/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('relu_int');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('relu_int/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'relu_int' HDL parameters
hdlset_param('relu_int', 'AdaptivePipelining', 'on');
hdlset_param('relu_int', 'HDLSubsystem', 'relu_int/HDL_DUT');
hdlset_param('relu_int', 'ProjectFolder', 'hdl_prj');
hdlset_param('relu_int', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('relu_int', 'SynthesisToolChipFamily', 'Artix UltraScale+');
hdlset_param('relu_int', 'SynthesisToolDeviceName', 'xcau10p-ffvb676-1-e');
hdlset_param('relu_int', 'SynthesisToolPackageName', '');
hdlset_param('relu_int', 'SynthesisToolSpeedValue', '');
hdlset_param('relu_int', 'TargetDirectory', 'hdl_prj\hdlsrc');
hdlset_param('relu_int', 'TargetFrequency', 100);
hdlset_param('relu_int', 'TargetLanguage', 'Verilog');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.AllowUnsupportedToolVersion = true;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndTestbench = true;
hWC.RunTaskVerifyWithHDLCosimulation = false;
hWC.RunTaskCreateProject = true;
hWC.RunTaskRunSynthesis = true;
hWC.RunTaskRunImplementation = true;
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
hdlcoder.runWorkflow('relu_int/HDL_DUT', hWC);
