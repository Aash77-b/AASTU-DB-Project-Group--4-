use("property_rental");


db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["fullName", "email", "password", "role"],
      properties: {
        fullName: { bsonType: "string" },
        email: { bsonType: "string" },
        password: { bsonType: "string" },
        role: { enum: ["owner", "tenant"] }
      }
    }
  }
});

db.createCollection("locations", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["city", "subcity"],
      properties: {
        city: { bsonType: "string" },
        subcity: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("properties", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["title", "propertyType", "price", "userId", "locationId"],
      properties: {
        title: { bsonType: "string" },
        propertyType: { bsonType: "string" },
        price: { bsonType: "number" },
        status: { enum: ["available", "rented", "not_available"] }
      }
    }
  }
});

db.createCollection("propertyPhotos");



const user1 = db.users.insertOne({
  fullName: "Edilawit Legesse",
  email: "edel@gmail.com",
  phone: "0945678909",
  password: "hashed_pw",
  role: "owner",
  createdAt: new Date()
}).insertedId;

const user2 = db.users.insertOne({
  fullName: "Eden Alemayehu",
  email: "eden@gmail.com",
  phone: "0911897589",
  password: "hashed_pw",
  role: "owner",
  createdAt: new Date()
}).insertedId;



const loc1 = db.locations.insertOne({
  city: "Addis Ababa",
  subcity: "Bole"
}).insertedId;

const loc2 = db.locations.insertOne({
  city: "Addis Ababa",
  subcity: "Goro"
}).insertedId;



const prop1 = db.properties.insertOne({
  title: "2 Bedroom Apartment",
  description: "Clean and modern",
  propertyType: "apartment",
  price: 15000,
  bedrooms: 2,
  areaSize: 120,
  status: "available",
  userId: user1,
  locationId: loc1,
  createdAt: new Date()
}).insertedId;

const prop2 = db.properties.insertOne({
  title: "Family House",
  description: "Spacious with parking",
  propertyType: "house",
  price: 25000,
  bedrooms: 3,
  areaSize: 200,
  status: "rented",
  userId: user2,
  locationId: loc2,
  createdAt: new Date()
}).insertedId;



db.propertyPhotos.insertMany([
  { photoUrl: "https://img.com/p1.jpg", propertyId: prop1 },
  { photoUrl: "https://img.com/p2.jpg", propertyId: prop2 }
]);



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
