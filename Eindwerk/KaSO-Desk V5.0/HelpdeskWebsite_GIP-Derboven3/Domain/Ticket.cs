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
        private DateTime _dtmGemaakt;
        private DateTime _dtmOpgelost;

        public Ticket(int pid, string pgebruiker, string pcategorie, string ponderwerp, string pstatus, DateTime pdatumgemaakt, DateTime pdatumopgelost)
        {
            _id = pid;
            _gebruiker = pgebruiker;
            _categorie = pcategorie;
            _onderwerp = ponderwerp;
            _status = pstatus;
            _dtmGemaakt = pdatumgemaakt;
            _dtmOpgelost = pdatumopgelost;
        }

        public int Id { get => _id; set => _id = value; }
        public string Gebruiker { get => _gebruiker; set => _gebruiker = value; }
        public string Categorie { get => _categorie; set => _categorie = value; }
        public string Onderwerp { get => _onderwerp; set => _onderwerp = value; }
        public string Status { get => _status; set => _status = value; }
        public DateTime DtmGemaakt { get => _dtmGemaakt; set => _dtmGemaakt = value; }
        public DateTime DtmOpgelost { get => _dtmOpgelost; set => _dtmOpgelost = value; }

        public override string ToString()
        {
            return _categorie + " - " + _onderwerp + " op " + _dtmGemaakt.ToShortDateString() + " zei " + _gebruiker + " : "  + _status;
        }

    }
}
