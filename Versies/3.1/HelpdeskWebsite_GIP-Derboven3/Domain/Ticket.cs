using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Ticket
    {
        private int _id;
        private string _gebruiker;
        private string _categorie;
        private string _onderwerp;
        private string _status;
        private DateTime _datumGemaakt;
        private DateTime _datumOpgelost;

        //Constructor
        public Ticket(int pid, string pgebruiker, string pcategorie, string ponderwerp, string pstatus, DateTime pdatumgemaakt, DateTime pdatumopgelost)
        {
            _id = pid;
            _gebruiker = pgebruiker;
            _categorie = pcategorie;
            _onderwerp = ponderwerp;
            _status = pstatus;
            _datumGemaakt = pdatumgemaakt;
            _datumOpgelost = pdatumopgelost;
        }

        public int Id { get => _id; set => _id = value; }
        public string Gebruiker { get => _gebruiker; set => _gebruiker = value; }
        public string Categorie { get => _categorie; set => _categorie = value; }
        public string Onderwerp { get => _onderwerp; set => _onderwerp = value; }
        public string Status { get => _status; set => _status = value; }
        public DateTime DatumGemaakt { get => _datumGemaakt; set => _datumGemaakt = value; }
        public DateTime DatumOpgelost { get => _datumOpgelost; set => _datumOpgelost = value; }


        //ToString() functie
        public override string ToString()
        {
            return _categorie + " - " + _onderwerp + " op " + _datumGemaakt.ToShortDateString() + " zei " + _gebruiker + " : "  + _status;
        }

        //Properties

    }
}
