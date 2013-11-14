# Clase Base Matriz

class Matriz

  attr_reader :nfil, :ncol, :mat # metodos de acceso (getter)
  
  # metodo que inicializa la matriz 
  
  def initialize(nfil,ncol,mat)  
    @nfil = nfil # inicializo numero de filas
    @ncol = ncol # inicializo numero de columnas 
    @mat = Array.new(mat) #inicializo la matriz pasando como parametro un objeto de tipo matriz 
  end

  # metodo que muestra la matriz como una cadena
  
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
      return Matriz.new(other.nfil,other.ncol,m) 
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
      return Matriz.new(other.nfil,other.ncol,m) 
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
    return Matriz.new(self.nfil,other.ncol,m)  
  end
   
end


class MatrizDensa < Matriz
#  metodos redifinidos de la clase base Matriz  
end

class MatrizDispersa < Matriz
#  metodos redifinidos de la clase base Matriz   
end


   
end   

  


  
 

  

    
  

  
  
 
  

  
 
