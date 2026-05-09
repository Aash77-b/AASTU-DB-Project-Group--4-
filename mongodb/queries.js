use property_rental;


db.createCollection("users");
db.createCollection("locations");
db.createCollection("properties");
db.createCollection("propertyPhotos");


const userResult = db.users.insertMany([
   {
  fullName: "Eden Alemayehu",
  email: "eden@gmail.com",
  phone: "0956748932",
  password: "hashed_pw",
  role: "owner",
  createdAt: new Date("2026-05-01")
},

{
  fullName: "Ashenafi Gebremedhn",
  email: "ashenafi@gmail.com",
  phone: "0946848962",
  password: "hashed_pw",
  role: "tenant",
  createdAt: new Date("2026-05-02")
}
]);

const u1 = userResult.insertedIds[0]; 
const u2 = userResult.insertedIds[1];



const locResult = db.locations.insertMany([
  {
  city: "Addis Ababa",
  subcity: "Bole"
},

 {
  city: "Addis Ababa",
  subcity: "Goro"
}
  ]);

const l1 = locResult.insertedIds[0]; 
const l2 = locResult.insertedIds[1];



const propResult = db.properties.insertMany([
  {
  title: "2 Bedroom Apartment",
  description: "Clean and modern apartment",
  propertyType: "apartment",
  price: 15000,
  bedrooms: 2,
  areaSize: 120,
  status: "available",
  userId: u1,
  locationId: l1,
  createdAt: new Date()
},
{
  title: "Family House",
  description: "Spacious house with parking",
  propertyType: "house",
  price: 25000,
  bedrooms: 3,
  areaSize: 200,
  status: "rented",
  userId: u1,
  locationId: l2,
  createdAt: new Date()
}
]);

const p1 = propResult.insertedIds[0];
const p2 = propResult.insertedIds[1];



db.propertyPhotos.insertMany([
  { photoUrl: "https://img.com/p1.jpg", propertyId: p1 },
  { photoUrl: "https://img.com/p2.jpg", propertyId: p2 }
]);


db.users.find();

db.properties.find({ status: "available" });


db.properties.find({ price: { $lt: 20000 } });


db.properties.aggregate([
  {
    $lookup: {
      from: "locations",
      localField: "locationId",
      foreignField: "_id",
      as: "location"
    }
  }
]);

db.properties.find({ bedrooms: { $gte: 2 } });

db.locations.find();
