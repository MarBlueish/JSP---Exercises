//
// Created by Marco on 26/03/2024.
//
using namespace std;
#include "Agenda.h"
#include <vector>
#include <iostream>
#include <fstream>

//funçoes

void Agenda::adicionarContacto(const Contacto& newContacto) {
    contactos.push_back(newContacto); // da pushback a um novo contacto
}

void Agenda::listarContactos(const vector<Contacto>& newListarContactos) {
    for(Contacto contacto: contactos){ //itera o vetor de contactos e lista todas as infos
       cout << "Numero: " << contacto.GETNumero() << endl;
       cout << "Nome: " << contacto.GETNome() << endl;
       cout << "Telefone: " << contacto.GETTelefone() << endl;
       cout << "Email: " << contacto.GETEmail() << endl;
    }
}

void Agenda::guardarAgenda() {

}

void Agenda::gerarPDF() {

}

void Agenda::imprimirAgenda() {

}