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

        // =========================================================
        // ==                  TICKETTEN                          ==
        // =========================================================

        //stel de datum opgelost van het ticket in.
        public void set_dtmOpgelost(int pTicketID)
        {
            _persistence.set_dtmOpgelost(pTicketID);
        }

        //Lees alle ticketten in.
        public List<Ticket> read_tickets()
        {
            return _persistence.read_tickets();
        }

        //Lees alle ticketten van een gebruiker in.
        public List<Ticket> read_tickets_gebruiker(int pGebruikerID)
        {
            return _persistence.read_tickets_gebruiker(pGebruikerID);
        }

        //insert ticket
        public int insert_ticket(int pGebruikerID, int pCategorieID, string pOnderwerp)
        {
            return _persistence.insert_ticket(pGebruikerID, pCategorieID, pOnderwerp);
        }

        //Delete een ticket 
        public void delete_ticket(int pTicketID)
        {
            _persistence.delete_ticket(pTicketID);
        }

        //update een ticket 
        public void update_ticket(int pTicketID, int pCategorieID, int pStatusID, string pOnderwerp)
        {
            _persistence.update_ticket(pTicketID, pCategorieID, pStatusID, pOnderwerp);
        }

        //update een ticket zonder de status mee te update
        public void update_ticket_status(int pTicketID, int pCategorieID, string pOnderwerp)
        {
            _persistence.update_ticket_status(pTicketID, pCategorieID, pOnderwerp);
        }

        // update enkel de status van een ticket
        public void update_status_ticket(int pTicketID)
        {
            _persistence.update_status_ticket(pTicketID);
        }

        // =========================================================
        // ==                  MELDINGEN                          ==
        // =========================================================

        //insert een nieuwe melding
        public void insert_melding(int pGebruikerID, string pOmschrijving, string pUrl)
        {
            _persistence.insert_melding(pGebruikerID, pOmschrijving, pUrl);
        }

        //Stel de gelezen flag van een status in
        public void set_gelezen(int pMeldingID)
        {
            _persistence.set_gelezen(pMeldingID);
        }

        //Lees de nieuwe meldingen van een gebruiker in
        public List<Melding> read_meldingen_gebruiker(int pGebruikerID)
        {
            return _persistence.read_meldingen_gebruiker(pGebruikerID);
        }

        //Lees alle meldingen van een gebruiker in
        public List<Melding> read_meldingen(int pGebruikerID)
        {
            return _persistence.read_meldingen(pGebruikerID);
        }

        // =========================================================
        // ==                  COUNTS                             ==
        // =========================================================

        //Tel de gebruikers per soort (bv, admin: 3, gebruiker: 5 Super User;1)
        public int count_gebruikers_soort(string pSoort) 
        {
            return _persistence.count_gebruikers_soort(pSoort);
        }

        //Tel de tickets per status (bv, Gesloten: 5, onbekend 3)
        public int count_tickets_status(string pStatus)
        {
            return _persistence.count_tickets_status(pStatus);
        }

        //Tel het aantal ticketten voor een gebruiker
        public int count_tickets_status_gebruiker(string pStatus, int pGebruikerID)
        {
            return _persistence.count_tickets_status_gebruiker(pStatus, pGebruikerID);
        }

        //Tel het aantal meldingen voor een gebruiker
        public int count_meldingen_gebruiker(int pGebruikerID)
        {
            return _persistence.count_meldingen_gebruiker(pGebruikerID);
        }

        //Tel de tickets van een genruiker
        public int count_tickets_gebruiker(int pGebruikerID)
        {
            return _persistence.count_tickets_gebruiker(pGebruikerID);
        }

        //Tel alle tickets
        public int count_tickets()
        {
            return _persistence.count_tickets();
        }

        // =========================================================
        // ==                  GETS                               ==
        // =========================================================

        //Krijg het uniek id door de input van een unieke gebruikersnaam
        public int read_gebruikerID_naam(string pNaam)
        {
            return _persistence.read_gebruikerID_naam(pNaam);
        }

        //Krijg het uniek id door de input van een uniek ticketID
        public int read_gebruikerID_ticket(int pTicketID)
        {
            return _persistence.read_gebruikerID_ticket(pTicketID);
        }

        // =========================================================
        // ==                  ANTWOORDEN                         ==
        // =========================================================

        //Lees de antwoorden van een ticket
        public List<Antwoord> read_antwoorden_ticket(int pTicketID)
        {
            return _persistence.read_antwoorden_ticket(pTicketID);
        }

        //insert een antwoord
        public void insert_antwoorden(int pGebruikerID, string pOmschrijving, int pTicketID)
        {
            _persistence.insert_antwoorden(pGebruikerID, pOmschrijving, pTicketID);
        }

        //delete een antwoord
        public void delete_antwoorden(int pAntwoordID)
        {
            _persistence.delete_antwoorden(pAntwoordID);
        }

        //update een antwoord
        public void update_antwoord(int pAntwoordID, string pOmschrijving)
        {
            _persistence.update_antwoord(pAntwoordID, pOmschrijving);
        }

        // =========================================================
        // ==         STATUS & CATEGORIE & groepen                ==
        // =========================================================

        //geef alle statussen weer
        public List<Status> read_statussen()
        {
            return _persistence.read_statussen();
        }

        //geef alle categorieen weer
        public List<Categorie> read_categorieen()
        {
            return _persistence.read_categorieen();
        }

        //Lees alle groepen
        public List<Role> read_groepen()
        {
            return _persistence.read_groepen();
        }

        // =========================================================
        // ==                LOGIN & REGISTER                     ==
        // =========================================================

        //LOGIN
        public int login(string pNaam, string pPasswoord)
        {
            return _persistence.login(pNaam, pPasswoord);
        }

        //soort gebruiker ophalen
        public string SoortGebruiker(int pGebruikerID)
        {
            return _persistence.SoortGebruiker(pGebruikerID);
        }

        //Check oàf de naam nog available is.
        public bool AvailableNaam(string pNaam)
        {
            return _persistence.AvailableNaam(pNaam);
        }

        //check of de email nog available is.
        public bool AvailableEmail(string pEmail)
        {
            return _persistence.AvailableEmail(pEmail);
        }

        //register
        public string register(string pNaam, string pEmail, string pPasswoord)
        {
            return _persistence.register(pNaam, pEmail, pPasswoord);
        }

        //reset passwoord
        public string ResetPassword(int pGebruikerID, string pOudPasswoord, string pNieuwPasswoord)
        {
            return _persistence.ResetPassword(pGebruikerID, pOudPasswoord, pNieuwPasswoord);
        }

        //stel standaard passwoord in
        public bool StandaardPasswoord(int pGebruikerID)
        {
            return _persistence.StandaardPasswoord(pGebruikerID);
        }

        //encryptie voor de URL
        public string Encrypt_QueryString(string str)
        {
            return _persistence.Encrypt_QueryString(str);
        }

        //Decrypt voor de URL
        public string Decrypt_QueryString(string str)
        {
            return _persistence.Decrypt_QueryString(str);
        }

        // =========================================================
        // ==                GEBRUIKERS                           ==
        // =========================================================

        //lees alle gebruikers in
        public List<Gebruiker> read_gebruikers()
        {
            return _persistence.read_gebruikers();
        }

        //lees 1 gebruiker met zijn id
        public Gebruiker read_gebruiker_id(int pGebruikerID)
        {
            return _persistence.read_gebruiker_id(pGebruikerID);
        }

        //lees alle admins en gebruikers in
        public List<Gebruiker> read_gebruikers_admins()
        {
            return _persistence.read_gebruikers_admins();
        }

        //lees alle admins in
        public List<Gebruiker> read_admins()
        {
            return _persistence.read_admins();
        }

        //update een gebruiker (admin + groep)
        public void update_gebruikers(string pNaam, string pEmail, int pGroepID, bool pActief, int pGebruikerID)
        {
            _persistence.update_gebruikers(pNaam, pEmail, pGroepID, pActief, pGebruikerID);
        }

        //update 1 gebruiker (profiel)
        public void update_profiel(string pNaam, string pEmail, int pGebruikerID)
        {
            _persistence.update_profiel(pNaam, pEmail, pGebruikerID);
        }

        //delete een gebruiker
        public void delete_gebruiker(int gebruikerID)
        {
            _persistence.delete_gebruiker(gebruikerID);
        }
    }
}
