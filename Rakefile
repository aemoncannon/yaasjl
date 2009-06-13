DEBUG = true

MXMLC = PLATFORM =~ /win32/ ? "mxmlc.exe -target-player=10.0.0" : "mxmlc -target-player=10.0.0"
COMPC = PLATFORM =~ /win32/ ? "compc.exe -target-player=10.0.0" : "compc -target-player=10.0.0"
SEVEN_ZIP = PLATFORM =~ /win32/ ? "7z.exe" : "7z"

ASDOC_OUTPUT_DIR = "asdocs"
DEBUG_PROJECTOR = PLATFORM =~ /win32/ ? "sa_flashplayer_9_debug.exe" : "~/bin/flashplayer_debug_projector_10"

SHARED_CLASS_PATH = ["src"]

ASDOC_OPTIONS = ["-compiler.source-path #{SHARED_CLASS_PATH.join(" ")}",
                 "-doc-sources ./src/com/aemon/",
                 "-library-path+=./lib/FlexUnit.swc",
                 "-compiler.library-path+=./lib/as3corelib.swc",
                 "-exclude-classes com.adobe.net.URI", # <-- Hairy syntax breaks asdoc.
#                 "-define+=COMPILATION_CONSTANTS::debug,\"#{DEBUG}\""
                ]

COMPILE_OPTIONS = [
                   "+configname=flex",
                   "-benchmark",
                   "-default-background-color 0x000000",
                   "-default-frame-rate=120",
                   "-compiler.warn-no-type-decl=true",
                   "-compiler.optimize=true",
                   "-incremental=true",
                   "-compiler.debug=#{DEBUG}",
                   "-compiler.library-path+=./lib/FlexUnit.swc",
                   "-compiler.library-path+=./lib/as3corelib.swc",
                   "-compiler.source-path #{SHARED_CLASS_PATH.join(" ")}",
#                   "-define+=COMPILATION_CONSTANTS::debug,\"#{DEBUG}\"", 
                   "-default-size 1280 720"
                  ]

SWC_OPTIONS = [
               "-default-background-color 0x000000",
               "-directory=false",
               "-compiler.debug=#{DEBUG}",
               "-compiler.warn-no-type-decl=true",
               "-compiler.optimize=true",
               "-source-path #{SHARED_CLASS_PATH.join(" ")}",
               "-compiler.library-path+=./lib/as3corelib.swc",
               "-compiler.library-path+=./lib/OVP_2_0_0.swc",
#               "-define+=COMPILATION_CONSTANTS::debug,\"#{DEBUG}\""
              ]

SHARED_SOURCES = FileList["./Rakefile"] + FileList["./src/**/*"] 
THIS_RAKEFILE = FileList["./Rakefile"]


BENCHMARK_TARGET = "./bin/benchmark.swf"
file BENCHMARK_TARGET => SHARED_SOURCES do
  sh "#{MXMLC} #{COMPILE_OPTIONS.join(" ")} -file-specs src/com/aemon/json/Benchmark.as -output=#{BENCHMARK_TARGET}"
end

UNIT_TEST_RUNNER_TARGET = "./bin/unit_test_runner.swf"
file UNIT_TEST_RUNNER_TARGET => SHARED_SOURCES  do
  sh "#{MXMLC} #{COMPILE_OPTIONS.join(" ")} -file-specs src/com/aemon/json/test/FlexUnitTestRunner.mxml -output=#{UNIT_TEST_RUNNER_TARGET}"
end

#SWC_TARGET = "./bin/receiver.swc"
#file SWC_TARGET => SHARED_SOURCES do
#  sh "#{COMPC} #{SWC_OPTIONS.join(" ")} -output=#{SWC_TARGET}"
#end
#
#task :asdoc => [] do
#  FileUtils.rm_rf Dir.glob("#{ASDOC_OUTPUT_DIR}/*")
#  sh "#{ASDOC} #{ASDOC_OPTIONS.join(" ")}  -output=#{ASDOC_OUTPUT_DIR}"
#  sh "#{SEVEN_ZIP} a ./bin/asdocs.zip ./asdocs"
#end

#task :swc => [SWC_TARGET] do
#end
#

task :benchmark => [BENCHMARK_TARGET] do
  sh "#{DEBUG_PROJECTOR} #{BENCHMARK_TARGET}"
end

task :units => [UNIT_TEST_RUNNER_TARGET] do
  sh "#{DEBUG_PROJECTOR} #{UNIT_TEST_RUNNER_TARGET}"
end

task :default => [:benchmark]












