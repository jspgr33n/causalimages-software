


config_defaults_AnalyzeImageConfounding  <-
  list(
    file = NULL,
    imageKeysOfUnits = NULL,
    fileTransport = NULL,
    imageKeysOfUnitsTransport = NULL,
    nBoot = 10L,
    inputAvePoolingSize = 1L,
    useTrainingPertubations = T,
    
    orthogonalize = F,
    transportabilityMat = NULL,
    latTransport = NULL,
    longTransport = NULL,
    lat = NULL,
    long = NULL,
    conda_env = "CausalImagesEnv",
    conda_env_required = T,
    Sys.setenv_text = NULL,
    figuresTag = NULL,
    figuresPath = "./",
    plotBands = 1L,
    plotResults = T,
    optimizeImageRep = T,
    nWidth_ImageRep = 64L,  nDepth_ImageRep = 1L, kernelSize = 5L,
    nWidth_Dense = 64L,  nDepth_Dense = 1L,
    imageModelClass = "VisionTransformer",
    pretrainedModel = NULL,
    strides = 2L,
    nDepth_TemporalRep = 3L,
    patchEmbedDim = 16L,
    dropoutRate = 0.1,
    batchSize = 16L,
    nSGD  = 400L,
    testFrac = 0.05,
    TfRecords_BufferScaler = 4L,
    learningRateMax = 0.001,
    TFRecordControl = NULL, 
    dataType = "image",
    image_dtype = "float16",
    atError = "stop", # stop or debug
    seed = NULL)

list2env(config_defaults_AnalyzeImageConfounding,globalenv())


config_specifics_AnalyzeImageConfounding <-
list(
  obsW = obsW[ take_indices ],
  obsY = obsY[ take_indices ],
  X = X[ take_indices,apply(X[ take_indices,],2,sd)>0],
  long = LongLat$geo_long[ take_indices ],
  lat = LongLat$geo_lat[ take_indices ],
  imageKeysOfUnits = KeysOfObservations[ take_indices ],
  file = tfrecord_loc, # point to tfrecords file
  nSGD = 200L,
  plotBands = c(1,2,3),
  figuresTag = "TutorialExample",
  figuresPath = "~/Downloads/TFRecordTutorial" # figures saved here (use absolute file paths)
)

list2env(config_specifics_AnalyzeImageConfounding,globalenv())



ai <- as.integer


f2n <- function(.){as.numeric(as.character(.))}

