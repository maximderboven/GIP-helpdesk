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
        public void update_ticket_status(int pTicketID, int pCategorieID, string pOnderwerp)
        {
            _persistence.update_ticket_status(pTicketID, pCategorieID, pOnderwerp);
        }

        public void update_status_ticket_open(int pTicketID)
        {
            _persistence.update_status_ticket_open(pTicketID);
        }

        public string Decrypt_QueryString(string str)
        {
            return _persistence.Decrypt_QueryString(str);
        }

        public string Encrypt_QueryString(string str)
        {
            return _persistence.Encrypt_QueryString(str);
        }

        public int read_gebruikerID_naam(string pNaam)
        {
           return _persistence.read_gebruikerID_naam(pNaam);
        }

        public int read_gebruikerID_ticket(int pTicketID)
        {
            return _persistence.read_gebruikerID_ticket(pTicketID);
        }

        public List<Ticket> read_tickets_admin(int pAdminID)
        {
            return _persistence.read_tickets_admin(pAdminID);
        }

        public void set_admin(int pTicketID, int pAdminID)
        {
            _persistence.set_admin(pTicketID, pAdminID);
        }

        public void update_profiel(string naam, string email, int gebruikerID)
        {
            _persistence.update_profiel(naam, email, gebruikerID);
        }

        public void set_gelezen(int pMeldingID)
        {
            _persistence.set_gelezen(pMeldingID);
        }

        public void insert_melding(int pGebruikerID, string pOmschrijving)
        {
            _persistence.insert_melding(pGebruikerID, pOmschrijving);
        }

        public int count_meldingen_gebruiker(int pGebruikerID)
        {
            return _persistence.count_meldingen_gebruiker(pGebruikerID);
        }

        public List<Melding> read_meldingen_gebruiker(int pGebruikerID)
        {
            return _persistence.read_meldingen_gebruiker(pGebruikerID);
        }
        public void setDatumGesloten(int ticketID)
        {
             _persistence.set_dtmOpgelost(ticketID);
        }
        /* Om een status terug op open te zetten wanneer een admin reageert:
        public void update_status_ticket(int ticketID)
        {
            _persistence.update_status_ticket(ticketID);
        }*/
        public Gebruiker read_gebruiker_id(int gebruikerID)
        {
            return _persistence.read_gebruiker_id(gebruikerID);
        }

        public List<Gebruiker> read_gebruikers_admins()
        {
            return _persistence.read_gebruikers_admins();
        }
        public int count_tickets_status_gebruiker(string status, int gebruikerID)
        {
            return _persistence.count_tickets_status_gebruiker(status, gebruikerID);
        }
        public List<Ticket> read_tickets()
        {
            return _persistence.read_tickets();
        }

        public List<Ticket> read_tickets_gebruiker(int id)
        {
            return _persistence.read_tickets_gebruiker(id);
        }

        public int insert_ticket(int gebruikerid, int categorieid, string onderwerp)
        {
           return _persistence.insert_ticket(gebruikerid, categorieid, onderwerp);
        }

        public void delete_ticket(int ticketID)
        {
            _persistence.delete_ticket(ticketID);
        }

        public void update_ticket(int ticketID, int categorieID, int statusID, string onderwerp)
        {
            _persistence.update_ticket(ticketID, categorieID, statusID, onderwerp);
        }

        public int count_tickets_status(string status)
        {
            return _persistence.count_tickets_status(status);
        }

        public int count_tickets_gebruiker(int gID)
        {
            return _persistence.count_tickets_gebruiker(gID);
        }

        public int count_tickets()
        {
            return _persistence.count_tickets();
        }

        public int count_gebruikers_soort(string soort)
        {
            return _persistence.count_gebruikers_soort(soort);
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


        public bool AvailableNaam(string naam) {
            return _persistence.AvailableNaam(naam);
        }

        public bool AvailableEmail(string email)
        {
            return _persistence.AvailableEmail(email);
        }

        public bool StandaardPasswoord(int userid)
        {
            return _persistence.StandaardPasswoord(userid);
        }
    }
}
