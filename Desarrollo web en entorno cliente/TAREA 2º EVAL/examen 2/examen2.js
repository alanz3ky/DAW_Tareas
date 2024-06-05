class Animal {
    constructor(nombre) {
        this.nombre = nombre;
    }

    hacersonido() {
        console.log("Haciendo sonido genérico");
    }
}

class Perro extends Animal {
    constructor(nombre, raza) {
        super(nombre);
        this.raza = raza;
    }

    hacerSonido() {
        console.log("Guau guau");
    }

    presentar() {
        console.log(`Soy un perro llamado ${this.nombre} de raza ${this.raza}.`);
    }
}

class Gato extends Animal {
    constructor(nombre, color) {
        super(nombre);
        this.color = color;
    }

    hacersonido() {
        console.log("Miau");
    }

    presentar() {
        console.log(`Soy un gato llamado ${this.nombre} de color ${this.color}.`);
    }
}

const miPerro = new Perro("Toby", "pastor alemán");
miPerro.presentar();
miPerro.hacerSonido();

const miGato = new Gato("Misifu", "marrón");
miGato.presentar();
miGato.hacersonido();

miPerro.hacersonido();
