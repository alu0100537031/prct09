require "./lib/matriz.rb"
#require "matriz.rb"	

        describe Matriz do
                before :each do
                        @m1 = Matriz.new(3,3)
			 @m1densa =  MatrizDensa.new(3,3,[[1,2,0],[3,4,0],[0,2,3]])
                        @m2densa =  MatrizDensa.new(3,3,[[7,10,5],[15,22,3],[2,3,4]])
			 frac1 = Fraccion.new(1,3)
			 frac2 = Fraccion.new(1,4)
                        @m3densa = MatrizDensa.new(3,3,[[frac1,frac2,frac1],[frac1,frac2,frac1],[frac2,frac2,frac1]])
			@m4dispersa = MatrizDispersa.new(3,3,[[0,0,10],[5,0,0],[0,0,40]])
			@m5dispersa = MatrizDispersa.new(3,3,[[0,0,4],[3,0,0],[0,0,2]])
                end
               
		describe "Se comprueba el numero de:" do
                        it "filas de la matriz" do
                                @m1.nfil.should eq(3)  
                        end
                        it "columnas de la matriz" do
                                @m1.ncol.should eq(3)  
                        end
                end
                                    
       
		
		describe "se debe comprobar si la " do
                  it " matriz es densa" do
                        (@m1densa.instance_of? MatrizDensa).should be_true 
                  end
		   it "matriz dispersa" do
                        (@m4dispersa.instance_of? MatrizDispersa).should be_true
		   end
		end   
        
  
		
                describe "se debe comprobar si la matriz ;" do
                        it " densa accede al subindice [0,0]" do
                                @m1densa.mat[0][0].should eq(1)
                        end
                        it "densa accede al subindice [0,1]" do
                                @m1densa.mat[0][1].should eq(2)
                        end
                        it "dispersa accede al subindice[1,0]" do
                                @m4dispersa.mat[1][0].should eq(5)
                        end
                        it "dispersa accede al subindice[2,2]" do
                                @m4dispersa.mat[2][2].should eq(40)
                        end
                end
		
		describe "se debe mostrar la " do
		  
		   it " matriz densa con enteros" do
                        @m2densa.to_s.should eq("  [ 7 10 5 ]\n  [ 15 22 3 ]\n  [ 2 3 4 ]\n ")
                  end
                  it " matriz densa con racionales" do
                        @m3densa.to_s.should eq("  [ 1/3 1/4 1/3 ]\n  [ 1/3 1/4 1/3 ]\n  [ 1/4 1/4 1/3 ]\n ")
                  end
		   it "matriz dispersa" do
                        @m4dispersa.to_s.should eq ({"[0][2]"=>10, "[1][0]"=>5, "[2][2]"=>40})
		   end
		end  
		
		
       end
	

             