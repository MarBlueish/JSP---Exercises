#include "Contacto.h"


//Inicia construtor
Contacto::Contacto() {
    numero ="";
    nome="";
    telefone="";
    email="";
}
//implementação de metodos gets e sets

string Contacto::GETNumero() {
    return numero;
}

void Contacto::SETNumero(string newNumero) {
    numero = newNumero;
}

string Contacto::GETNome() {
    return nome;
}

void Contacto::SETNome(string newNome) {
    nome = newNome;
}

string Contacto::GETTelefone() {
    return telefone;
}

void Contacto::SETTelefone(string newTelefone) {
    telefone = newTelefone;
}

string Contacto::GETEmail() {
    return email;
}

void Contacto::SETEmail(string newEmail) {
    email = newEmail;
}




