#require "./lib/matriz.rb"
require "matriz.rb"	

        describe Matriz do
                before :all do
                        @m1 = Matriz.new(3,3)
                end
                describe "Se comprueba el numero de:" do
                        it "filas de la matriz" do
                                @m1.nfil.should eq(3)  
                        end
                        it "columnas de la matriz" do
                                @m1.ncol.should eq(3)  
                        end
                end
        end
	
	describe MatrizDensa do
	  
                before :all do
		        
                        @m1densa =  MatrizDensa.new(3,3,[[1,2,0],[3,4,0],[0,2,3]])
                        @m2densa =  MatrizDensa.new(3,3,[[7,10,5],[15,22,3],[2,3,4]])
			 frac1 = Fraccion.new(1,3)
			 frac2 = Fraccion.new(1,4)
                        @m3densa = MatrizDensa.new(3,3,[[frac1,frac2,frac1],[frac1,frac2,frac1],[frac2,frac2,frac1]])
                      
                end
		
                describe "Acceder al subindice;" do
                        it "Para acceder al [0,0]" do
                                @m1densa.mat[0][0].should eq(1)
                        end
                        it "Para acceder al [0,1]" do
                                @m1densa.mat[0][1].should eq(2)
                        end
                        it "Para acceder al [1,0]" do
                                @m1densa.mat[1][0].should eq(3)
                        end
                        it "Para acceder al [2,2]" do
                                @m1densa.mat[2][2].should eq(3)
                        end
                end
	end	

             