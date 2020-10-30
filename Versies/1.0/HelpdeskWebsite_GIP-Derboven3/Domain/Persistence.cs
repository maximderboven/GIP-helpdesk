using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using System.Web;
using System.Web.Security;
using MySql.Data.MySqlClient;

namespace Domain
{
    class Persistence
    {
        private string _connString;
        private MySqlConnection _conn;
        private MySqlCommand _cmd;

        //connectie maken
        public void ConnectieMaken(string psql)
        {
            _connString = "server=localhost; user id=root; Password= Test123); database=dbhelpdesk;";
            _conn = new MySqlConnection(_connString);
            _cmd = new MySqlCommand(psql, _conn);
        }

        //Connectie voor Stored Procedure
        public void ConnectieMakenSP(string psql)
        {
            _connString = "server=localhost; user id=root; Password= Test123); database=dbhelpdesk;";
            _conn = new MySqlConnection(_connString);
            _cmd = new MySqlCommand(psql, _conn);
            _cmd.Connection = _conn;
            _cmd.CommandText = psql;
            _cmd.CommandType = System.Data.CommandType.StoredProcedure;
        }

        // TICKETTEN
        //=========================================================

        //Readtable van alle ticketten
        public List<Ticket> read_tickets()
        {
            List<Ticket> lijst = new List<Ticket>();
            Ticket vraag;
            ConnectieMakenSP("read_tickets");
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                vraag = new Ticket(Convert.ToInt16(dr["id"]), dr["vraag"].ToString(), dr["gebruiker"].ToString(), dr["categorie"].ToString(), dr["onderwerp"].ToString(), dr["status"].ToString(), Convert.ToDateTime(dr["datumgemaakt"]), Convert.ToDateTime(dr["datumopgelost"]));
                lijst.Add(vraag);
            }
            return lijst;
        }

        //Readtable van gebruikers ticketten   
        public List<Ticket> read_tickets_gebruiker(int id)
        {
            List<Ticket> lijst = new List<Ticket>();
            Ticket vraag;
            ConnectieMakenSP("read_tickets_gebruiker");
            _cmd.Parameters.AddWithValue("gebruikerID", id);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                vraag = new Ticket(Convert.ToInt16(dr["id"]), dr["vraag"].ToString(), dr["gebruiker"].ToString(), dr["categorie"].ToString(), dr["onderwerp"].ToString(), dr["status"].ToString(), Convert.ToDateTime(dr["datumgemaakt"]), Convert.ToDateTime(dr["datumopgelost"]));
                lijst.Add(vraag);
            }
            return lijst;
        }

        //insert ticket 
        public void insert_ticket(int gebruikerid, int categorieid, string onderwerp, string vraag)
        {
            ConnectieMakenSP("insert_tickets");
            _cmd.Parameters.AddWithValue("gID", gebruikerid);
            _cmd.Parameters.AddWithValue("cID", categorieid);
            _cmd.Parameters.AddWithValue("o", onderwerp);
            _cmd.Parameters.AddWithValue("v", vraag);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        //delete ticket van ticketten  
        public void delete_ticket(int ticketID)
        {
            string sql = "DELETE FROM dbhelpdesk.tblantwoorden WHERE ticketID=@ticketID; DELETE FROM dbhelpdesk.tbltickets WHERE id=@ticketID;";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@ticketID", ticketID);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        //update ticket van ticketten  
        public void update_ticket(int ticketID, string vraag, int categorieID, int statusID, string onderwerp)
        {
            ConnectieMakenSP("update_tickets");
            _cmd.Parameters.AddWithValue("v", vraag);
            _cmd.Parameters.AddWithValue("cID", categorieID);
            _cmd.Parameters.AddWithValue("sID", statusID);
            _cmd.Parameters.AddWithValue("o", onderwerp);
            _cmd.Parameters.AddWithValue("tID", ticketID);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        // ANTWOORDEN
        //=========================================================

        //Readtable van ticket antwoorden  
        public List<Antwoord> read_antwoorden_ticket(int id)
        {
            List<Antwoord> lijst = new List<Antwoord>();
            Antwoord antwoord;
            ConnectieMakenSP("read_antwoorden_ticket");
            _cmd.Parameters.AddWithValue("tID", id);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                antwoord = new Antwoord(Convert.ToInt16(dr["id"]), dr["omschrijving"].ToString(), dr["gebruiker"].ToString(), Convert.ToDateTime(dr["datumgemaakt"]));
                lijst.Add(antwoord);
            }
            return lijst;
        }

        //insert antwoord
        public void insert_antwoorden(int gebruikerid, string omschrijving, int ticketid)
        {
            ConnectieMakenSP("insert_antwoorden");
            _cmd.Parameters.AddWithValue("@gID", gebruikerid);
            _cmd.Parameters.AddWithValue("@o", omschrijving);
            _cmd.Parameters.AddWithValue("@tID", ticketid);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        //delete antwoord
        public void delete_antwoorden(int antwoordID)
        {
            string sql = "DELETE FROM dbhelpdesk.tblantwoorden WHERE id=@ID;";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@ID", antwoordID);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        //update ticket van ticketten  
        public void update_antwoord(int antwoordID, string omschrijving)
        {
            ConnectieMakenSP("update_antwoorden");
            _cmd.Parameters.AddWithValue("o", omschrijving);
            _cmd.Parameters.AddWithValue("aID", antwoordID);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        // STATUS & CATEGORIE
        //=========================================================

        //geef alle statussen weer
        public List<Status> statussen()
        {
            List<Status> lijst = new List<Status>();
            Status status;
            string sql = "SELECT * FROM dbhelpdesk.tblstatussen;";
            ConnectieMaken(sql);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                status = new Status(Convert.ToInt16(dr[0]), dr[1].ToString());
                lijst.Add(status);

            }
            return lijst;
        }

        //geef alle categories weer
        public List<Categorie> categorieen()
        {
            List<Categorie> lijst = new List<Categorie>();
            Categorie categorie;
            string sql = "SELECT * FROM dbhelpdesk.tblcategorieen;";
            ConnectieMaken(sql);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                categorie = new Categorie(Convert.ToInt16(dr[0]), dr[1].ToString());
                lijst.Add(categorie);

            }
            return lijst;
        }

        // LOGIN SYSTEM
        //=========================================================

        //LOGIN
        public int login(string naam, string password)
        {
            string sql = "SELECT * FROM dbhelpdesk.tblgebruikers where (naam=@naam or email=@email) and password=@password and actief=1;";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@naam", naam);
            _cmd.Parameters.AddWithValue("@email", naam);
            string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            _cmd.Parameters.AddWithValue("@password", hash);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            if (dr.Read())
            {
                return Convert.ToInt32(dr["id"]);
            }
            else
            {
                return 0;
            }
        }

        public string SoortGebruiker(int id)
        {
            string sql = "SELECT tblgroepen.omschrijving FROM dbhelpdesk.tblgebruikers inner join tblgroepen on groepID = tblgroepen.id where (tblgebruikers.id=@id);";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@id", id);
            _conn.Open();
            string groep = "onbekend";
            MySqlDataReader dr = _cmd.ExecuteReader();
            if (dr.Read())
            {
                 groep = dr["omschrijving"].ToString();
            }
            return groep;
        }

        public List<Gebruiker> read_gebruikers()
        {
            List<Gebruiker> lijst = new List<Gebruiker>();
            Gebruiker gebruiker;
            ConnectieMakenSP("read_gebruikers");
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                gebruiker = new Gebruiker(Convert.ToInt32(dr["id"]),dr["naam"].ToString(), dr["email"].ToString(),dr["groep"].ToString(),Convert.ToBoolean(dr["actief"]),Convert.ToDateTime(dr["dtmAangemaakt"]));
                lijst.Add(gebruiker);
            }
            return lijst;
        }
        //register
        public string register(string naam, string email, string password)
        {
            string sql = "SELECT * from tblgebruikers where (naam=@naam) or (email = @email)";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@naam", naam);
            _cmd.Parameters.AddWithValue("@email", email);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            if (dr.Read())
            {
                return "gebruikersnaam of email is al in gebruik";
            }
            else
            {
                sql = "INSERT INTO tblgebruikers (naam,email,password) VALUES (@naam,@email,@password) ";
                ConnectieMaken(sql);
                _cmd.Parameters.AddWithValue("@naam", naam);
                string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                _cmd.Parameters.AddWithValue("@password", hash);
                _cmd.Parameters.AddWithValue("@email", email);
                _conn.Open();
                int i = _cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    return "true";
                }
                else
                {
                    return "Er ging iets mis";
                }
            }

        }

        public string ResetPassword(int userid, string oudpasswoord, string nieuwpasswoord)
        {
            string sql = "SELECT * from tblgebruikers where (id=@id) and (password = @hash)";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@id", userid);
            string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(oudpasswoord, "SHA1");
            _cmd.Parameters.AddWithValue("@hash", hash);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            if (dr.Read())
            {
                sql = "UPDATE tblgebruikers SET password=@p WHERE id=@gID;";
                ConnectieMaken(sql);
                hash = FormsAuthentication.HashPasswordForStoringInConfigFile(nieuwpasswoord, "SHA1");
                _cmd.Parameters.AddWithValue("@p", hash);
                _cmd.Parameters.AddWithValue("@gID", userid);
                _conn.Open();
                int i = _cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    return "Je paswoord is sucessvol gewijzigd.";
                }
                else
                {
                    return "Er ging iets mis";
                }

            }
            else
            {
                return "Oud passwoord is incorrect.";
            }
        }

        // BEHEER GEBRUIKERS
        //=========================================================

        public void update_gebruikers(string naam, string email, int groepID, bool actief, int gebruikerID)
        {
            ConnectieMakenSP("update_gebruikers");
            _cmd.Parameters.AddWithValue("n", naam);
            _cmd.Parameters.AddWithValue("e", email);
            _cmd.Parameters.AddWithValue("GID", groepID);
            _cmd.Parameters.AddWithValue("a", Convert.ToInt32(actief));
            _cmd.Parameters.AddWithValue("aID", gebruikerID);
            _conn.Open();
            _cmd.ExecuteReader();
        }

        public List<Role> groepen()
        {
            List<Role> lijst = new List<Role>();
            Role groep;
            string sql = "SELECT * FROM dbhelpdesk.tblgroepen;";
            ConnectieMaken(sql);
            _conn.Open();
            MySqlDataReader dr = _cmd.ExecuteReader();
            while (dr.Read())
            {
                groep = new Role(Convert.ToInt16(dr[0]), dr[1].ToString());
                lijst.Add(groep);
            }
            return lijst;
        }

        public void delete_gebruiker(int gebruikerID)
        {
            string sql = "DELETE FROM dbhelpdesk.tblgebruikers WHERE id=@gebruikerID;";
            ConnectieMaken(sql);
            _cmd.Parameters.AddWithValue("@gebruikerID", gebruikerID);
            _conn.Open();
            _cmd.ExecuteReader();
        }
    }
}
