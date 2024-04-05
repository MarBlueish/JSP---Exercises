//
// Created by Marco on 26/03/2024.
//

#ifndef PROJETOFINAL_AGENDA_H
#define PROJETOFINAL_AGENDA_H

#include "Contacto.h"
#include <vector>


class Agenda {
public:
    void adicionarContacto(const Contacto& newContacto); // faz referencia const a um objeto do tipo "Contacto";
    void listarContactos(const vector<Contacto>& newListarContactos);
    void guardarAgenda();
    void carregarAgenda();
    void gerarPDF();
    void imprimirAgenda();
private:
    vector<Contacto>contactos; //criação de vetor contactos com objetos de tipo contacto
};


#endif //PROJETOFINAL_AGENDA_H
