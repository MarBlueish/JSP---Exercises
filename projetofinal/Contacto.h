//
// Created by Marco on 26/03/2024.
//

#include <string>


#ifndef PROJETOFINAL_CONTACTO_H
#define PROJETOFINAL_CONTACTO_H

using namespace std;

class Contacto {
public:
    Contacto(); // construtor
    // declaracao de metodos gets e sets
    string GETNumero();
    void SETNumero(string newNumero);
    string GETNome();
    void SETNome(string newNome);
    string GETTelefone();
    void SETTelefone(string newTelefone);
    string GETEmail();
    void SETEmail(string newEmail);

private: //private devido a apenas poder aceder dentro da classe
    string numero;
    string nome;
    string telefone;
    string email;
};





#endif //PROJETOFINAL_CONTACTO_H
