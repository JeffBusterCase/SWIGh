require "swigh/version"
require "mkmf"

module SWIGh
    
    TYPES = ["int", "float", "char", "double", "long", "short", "(", ")", "extern"]
    
    # get the current directory
    CURRENT_DIR = Dir.pwd
    
    def self.mike file, n=1, of=1
        raise RuntimeError, "argument must be a string" if file.class != String
        #get argument from bat comand line
        #file = ARGV[0] if !ARGV.empty?

        #get the file given
        constant = (File.read(CURRENT_DIR+"/"+file))
        module_scope = "//Automatic generated code\n\n%module#{file.sub(".h", "")}\n%{\n#include <#{file}>\n%}\n"

        #get extern functions
        functions = []
        constant.each_line{|line|
            for type in TYPES
                functions << line if (line.include?(type) && 
                    (!(functions.include?(line) ) &&
                        !(line.include?("\"")) )     ) && !(line.include?("#"))
            end
        }

        # write SWIG interface file
        File.open((CURRENT_DIR+"/"+(file.sub(".h", ".i") ) ), "w"){|f|
            f.puts module_scope
            f.puts *functions
        }

        # create swig files
        system "swig -ruby #{file.sub(".h", ".i")}"
    
        # create MakeFile
        Dir.chdir(CURRENT_DIR)
        create_makefile(file.sub(".h", ""))

        # make
        system 'make'

        # raise error if C compiler raised error and don't created file.so
        raise RuntimeError, "Something was wrong with your C/C++ File =(\nPlease fix it first" if !File.exist?(file.sub(".h", ".so"))

        # delete no usefull files 
        [
            file.sub(".h", "_wrap.c"),
            file.sub(".h", "_wrap.o"),
            file.sub(".h", ".o"),
            "Makefile"
        ].each { |file__|
            if File.exist? file__
                $stdout.puts "deleting #{file__}..."
                File.delete(file__);end
        }

        # alert alright
        $stdout.puts "  [ Finished successfully #{n.to_s} of #{of.to_s}]"
    end

    def self.mikes *file
        n = 1
        file.each {|e| self.mike(e, n, file.length); n += 1;}
        puts "--\n      [ Finished successfully all #{n.to_s} files ]"
    end
end
