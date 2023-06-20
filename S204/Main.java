import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String[] consultes = {
                "db.restaurants.find()",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0})",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:1, 'address.zipcode':1, _id:0})",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:'Bronx', _id:0})",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:'Bronx', _id:0}).limit(5)",
                "db.restaurants.find({},{restaurant_id:1, name:1, borough:'Bronx', _id:0}).skip(5).limit(5)",
                "db.restaurants.find({'grades.score':{$gt:90}})",
                "db.restaurants.find({'grades.score':{$gt:80,$lt:100}})",
                "db.restaurants.find({'address.coord':{$lt:-95.754168}})",
                "db.restaurants.find({cuisine:{$ne:'American'},'grades.score':{$gt:70},'address.coord':{$lt:-65.754168}})",
                "db.restaurants.find({cuisine:{$ne:'American'},'grades.score':{$gt:70},'address.coord':{$lt:-65.754168}})",
                "db.restaurants.find({cuisine:{$ne:'American'},'grades.grade':'A',borough:{$ne:'Brooklyn'}}).sort({cuisine:-1})",
                "db.restaurants.find({name:{$regex: /^Wil/}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({name:{$regex: /.*ces$/}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({name:{$regex: /.*Reg.*$/}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({borough:'Bronx', $or:[{cuisine: 'American'},{cuisine: 'Chinese'}]})",
                "db.restaurants.find({borough:{$in:['Staten Island', 'Queens', 'Bronx', 'Brooklyn']}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({borough:{$nin:['Staten Island', 'Queens', 'Bronx', 'Brooklyn']}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({'grades.score':{$lt:10}},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({$or:[{cuisine: {$nin:['American','Chinese']}},{name:{$regex: /^Wil/}}]},{restaurant_id:1, name:1, borough:1, cuisine:1})",
                "db.restaurants.find({'grades.grade':'A','grades.score':11, 'grades.date':ISODate('2014-08-11T00:00:00Z')},{restaurant_id:1, name:1, grades:1})",
                "db.restaurants.find({'grades.1.grade':'A','grades.1.score':9, 'grades.1.date':ISODate('2014-08-11T00:00:00Z')},{restaurant_id:1, name:1, grades:1})",
                "db.restaurants.find({'address.coord.1':{$gt:42,$lt:52}},{restaurant_id:1, name:1, addresss:1,'address.coord':1})",
                "db.restaurants.find().sort({name:1})",
                "db.restaurants.find().sort({name:-1})",
                "db.restaurants.find().sort({cuisine:1 , borough :-1})",
                " ",
                "db.restaurants.find({'address.coord':{$type:'double'}})"
        };

        String nombreArchivo = "consultes.js";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(nombreArchivo))) {
            for (String consulta : consultes) {
                writer.write(consulta + ";");
                writer.newLine();
            }
            System.out.println("Les consultes s'han guardat en l'arxiu: " + nombreArchivo);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}







