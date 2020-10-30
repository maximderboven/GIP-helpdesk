using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Business
    {
        private Persistence _persistence = new Persistence();

        // TICKETTEN
        //=========================================

        public List<Ticket> read_tickets()
        {
            return _persistence.read_tickets();
        }

        public List<Ticket> read_tickets_gebruiker(int id)
        {
            return _persistence.read_tickets_gebruiker(id);
        }

        public void insert_ticket(int gebruikerid, int categorieid, string onderwerp, string vraag)
        {
            _persistence.insert_ticket(gebruikerid, categorieid, onderwerp, vraag);
        }

        public void delete_ticket(int ticketID)
        {
            _persistence.delete_ticket(ticketID);
        }

        public void update_ticket(int ticketID, string vraag, int categorieID, int statusID, string onderwerp)
        {
            _persistence.update_ticket(ticketID, vraag, categorieID, statusID, onderwerp);
        }

        //ANTWOORDEN
        //=======================================

        public List<Antwoord> read_antwoorden_ticket(int id)
        {
            return _persistence.read_antwoorden_ticket(id);
        }

        public void insert_antwoorden(int gebruikerid, string omschrijving, int ticketid)
        {
            _persistence.insert_antwoorden(gebruikerid, omschrijving, ticketid);
        }

        public void delete_antwoorden(int antwoordID)
        {
            _persistence.delete_antwoorden(antwoordID);
        }

        public void update_antwoord(int antwoordID, string omschrijving)
        {
            _persistence.update_antwoord(antwoordID, omschrijving);
        }

        //STATUS & CATEGORIE
        //=========================================
        public List<Status> statussen()
        {
            return _persistence.statussen();
        }

        public List<Categorie> categorieen()
        {
            return _persistence.categorieen();
        }

        // LOGIN SYSTEM
        //=============================

        public int login(string naam, string password)
        {
            return _persistence.login(naam, password);
        }

        public string register(string naam, string email, string password)
        {
            return _persistence.register(naam, email, password);
        }

        public string SoortGebruiker(int id)
        {
            return _persistence.SoortGebruiker(id);
        }

        public string ResetPassword(int userid, string OudPassword, string nieuwpassword)
        {
            return _persistence.ResetPassword(userid, OudPassword, nieuwpassword);
        }

        public List<Gebruiker> read_gebruikers()
        {
            return _persistence.read_gebruikers();
        }

        public void update_gebruikers(string naam, string email, int groepID, bool actief, int gebruikerID)
        {
            _persistence.update_gebruikers(naam, email, groepID, actief, gebruikerID);
        }

        public List<Role> groepen()
        {
            return _persistence.groepen();
        }

        public void delete_gebruiker(int gebruikerID)
        {
             _persistence.delete_gebruiker(gebruikerID);
        }
    }
}
