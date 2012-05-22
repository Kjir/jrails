require 'java'

include_class 'javax.persistence.Persistence'
include_class 'javax.persistence.EntityManager'
include_class 'javax.persistence.EntityManagerFactory'
include_class 'java.util.List'
include_class 'eu.netprophecy.test.Note'

class Note
  attr_accessor :id, :text
  
   # Called by `paginate'
  def self.count(*args) 
    query = getEntityManager.createQuery("SELECT n FROM Note n") 
    count = query.getResultList().size();
    puts count
  end

  def self.find(*args)
    case args.first
    when :all   then find_all
    else             find_from_id(args.first)
    end
  end
  
  private
       
  def self.getEntityManager
    emf = Persistence.createEntityManagerFactory("Test")
    return emf.createEntityManager() 
  end

  def self.find_all
    query = getEntityManager.createQuery("SELECT n FROM Note n")
    list = query.getResultList()
      
    notes = []  #Create a new array to return
      
    list.each {|note|
      temp = Note.new
      temp.id = note.getId
      temp.text = note.getText
      notes << temp
    }
    return notes
  end
  
end