##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=Octopus
ConfigurationName      :=Debug
WorkspacePath          :=/home/grabli66/Workspace/Cpp
ProjectPath            :=/home/grabli66/Workspace/Cpp/Octopus
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=grabli66
Date                   :=12/30/18
CodeLitePath           :=/home/grabli66/.codelite
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/octopus.hdll
Preprocessors          :=$(PreprocessorSwitch)LIBHL_EXPORTS 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="Octopus.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -s
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/home/grabli66/WorkspaceTest/hashlink/src/ $(IncludeSwitch)/home/grabli66/Workspace/Cpp/Octopus/Libs/Modest/include/
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)modest_static 
ArLibs                 :=  "modest_static" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/home/grabli66/Workspace/Cpp/Octopus/Libs/Modest/lib/

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g  $(Preprocessors)
CFLAGS   :=  -g -O2 -std=c++11 -fPIC -lm -Wl,--export-dynamic -Wl,--no-undefined $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/Src_html.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(SharedObjectLinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)
	@$(MakeDirCommand) "/home/grabli66/Workspace/Cpp/.build-debug"
	@echo rebuilt > "/home/grabli66/Workspace/Cpp/.build-debug/Octopus"

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/Src_html.c$(ObjectSuffix): Src/html.c $(IntermediateDirectory)/Src_html.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/grabli66/Workspace/Cpp/Octopus/Src/html.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Src_html.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Src_html.c$(DependSuffix): Src/html.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Src_html.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Src_html.c$(DependSuffix) -MM Src/html.c

$(IntermediateDirectory)/Src_html.c$(PreprocessSuffix): Src/html.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Src_html.c$(PreprocessSuffix) Src/html.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


