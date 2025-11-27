import express from "express";
import sqlite3 from "sqlite3";

const db = new sqlite3.Database('db.sqlite');

const app = express();
const port = 3000;
app.use(express.json());

let ads = [
  {
    id: 1,
    title: "Bike to sell",
    description:
      "My bike is blue, working fine. I'm selling it because I've got a new one",
    owner: "bike.seller@gmail.com",
    price: 100,
    picture:
      "https://images.lecho.be/view?iid=dc:113129565&context=ONLINE&ratio=16/9&width=640&u=1508242455000",
    location: "Paris",
    createdAt: "2023-09-05T10:13:14.755Z",
  },
  {
    id: 2,
    title: "Car to sell",
    description:
      "My car is blue, working fine. I'm selling it because I've got a new one",
    owner: "car.seller@gmail.com",
    price: 10000,
    picture:
      "https://www.automobile-magazine.fr/asset/cms/34973/config/28294/apres-plusieurs-prototypes-la-bollore-bluecar-a-fini-par-devoiler-sa-version-definitive.jpg",
    location: "Paris",
    createdAt: "2023-10-05T10:14:15.922Z",
  },
];

app.get("/", (req, res) => {
  db.all("SELECT * FROM annonce", (err, rows) => {
    if (err) {
    return res.status(500).send("Erreur");
    }
    res.send(rows);
  });
});

app.post("/ads", (req, res) => {
  const { title, price, city, description, category_id } = req.body;
  db.run(
    "INSERT INTO annonce (title, price, city, description, category_id) VALUES (?, ?, ?, ?, ?)",
    [title, price, city, description, category_id],
    function (err) {
      if (err) {
        return res.status(500).send("Erreur");
      }
      res.send("Annonce ajoutée");
    }
  );
});

app.delete("/ads/:id", (req, res) => {
  const id = parseInt(req.params.id);
  db.run(
    "DELETE FROM annonce WHERE id = ?",
    id,
    function (err) {
      if (err) {
        return res.status(500).send("Erreur");
      }
      res.send("Annonce supprimée");
    }
  );
});

app.patch("/ads/:id", (req, res) => {
  const id = parseInt(req.params.id);
  db.run(
    "UPDATE ads SET title=$title, price=$price WHERE id = $id",
    { $title: req.body.title, $price: req.body.price, $id: id },
    function (err) {
      if (err) {
        return res.status(500).send("Erreur");
      }
      res.send("Annonce mise à jour");
    }
  );
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
