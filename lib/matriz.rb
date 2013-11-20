# Clase Base Matriz

class Matriz
  require "./lib/racional.rb"

  attr_reader :nfil, :ncol, :mat # metodos de acceso (getter)
  
  # metodo que inicializa la matriz 
  
  def initialize(nfil,ncol)  
    @nfil = nfil # inicializo numero de filas
    @ncol = ncol # inicializo numero de columnas 
  end
end  




class MatrizDensa < Matriz
  
  attr_reader :mat # metodos de acceso (getter)
  
  def initialize(nfil,ncol,mat) 
     super(nfil, ncol)
     @mat = Array.new(mat) #inicializo la matriz pasando como parametro un objeto de tipo matriz 
  end

#Funcion que devuelve una posicion i dentro de la matriz  
  
  def [](i)
    return mat[i]
  end

   
#Funcion que asigna un valor k a una posicion i,j dentro de la matriz
   
   def []=(i, j, k)
      return mat[i][j] = k
   end
  

  def to_s
     cad = " "
    for i in 0...nfil
      cad << " [ "
      for j in 0...ncol
	cad <<  "#{mat[i][j]} "
      end
      cad << "]"
      cad << "\n "
    end
    return cad
  end 

  # metodo que suma dos matrices (Sobrecarga del operador +)
  
   def +(other)
      raise ArgumentError, "Las matrices no son cuadradas." unless @nfil == other.nfil && @ncol == other.ncol
      m = Array.new(@nfil){Array.new(@ncol){0}}
      for i in 0...nfil 
         for j in 0...ncol
             m[i][j] = self.mat[i][j]+ other.mat[i][j]
         end
      end
      return MatrizDensa.new(other.nfil,other.ncol,m) 
   end
   
    # metodo que resta dos matrices (Sobrecarga del operador -)
  
   def -(other)
      raise ArgumentError, "Las matrices no son cuadradas." unless @nfil == other.nfil && @ncol == other.ncol
      m = Array.new(@nfil){Array.new(@ncol){0}}
      for i in 0...nfil 
         for j in 0...ncol
	     m[i][j] = mat[i][j]- other.mat[i][j]
         end
      end
      return MatrizDensa.new(other.nfil,other.ncol,m) 
   end

   # metodo que multiplica dos matrices (Sobrecarga del operador *)
   
   
  def *(other)
    m = Array.new(@nfil){Array.new(@ncol){0}}
    for i in 0...nfil do
      for j in 0...other.ncol do  
        for k in 0...ncol do
          m[i][j] = m[i][j] + self.mat[i][k] * other.mat[k][j]
         end
      end
    end
    return MatrizDensa.new(self.nfil,other.ncol,m)  
  end
   
end 


class MatrizDispersa < Matriz
  attr_reader:hash , :mat
  def initialize (nfil, ncol, mat)
    super(nfil, ncol)
    @mat = Array.new(mat)
    nceros = 0 # numero de elementos nulos de la matriz (0)
    nelementos= (nfil * ncol)*0.6 # elementos de la matriz aplicado el 60 % 
    psincero = 0 # posiciones de los elementos de la matriz cuyo valor no es nulo (0)
    @hash = Hash.new(0)
    for i in 0..nfil do
       for j in 0..ncol do
           if (mat[i][j]==0)  
               nceros=nceros+1
            else
               # hash
	       print "Valores"
               puts psincero="[#{i}][#{j}]"
               @hash[psincero]=mat[i][j]
	       puts hash.length
	       puts hash
            end
       end
    end
      if nceros >= nelementos
	 puts "La matriz es dispersa" 
      else
	 raise ArgumentError, 'La Matriz no es dispersa'
      end
 end
end 





   
#end 

frac1 = Fraccion.new(1,3)
#puts frac1+1
puts 1-frac1 
puts frac1-1
frac2 = Fraccion.new(1,4)
m1 = MatrizDensa.new(2,2,[[1,2],[3,4]])
puts m1[0].size
puts m1[1].size
m2 = MatrizDensa.new(2,2,[[7,10],[15,22]])
m3 = MatrizDensa.new(2,2,[[frac1,frac2],[frac1,frac2]])
m4 = MatrizDispersa.new(2, 2, [[0,0,1],[1,2,3],[0,0,1]])
puts "     M1   "
puts m1.to_s
puts "     M2   "
puts m2.to_s
puts "     M3   "
puts m3.to_s
puts " Suma (M1+M2)"
puts m2+m1
puts " Resta(M1-M2)"
puts m2-m1
puts " Producto(M1*M2)"
puts m2*m1

  


  
 

  

    
  

  
  
 
  

  
 
