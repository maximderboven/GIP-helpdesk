using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Antwoord
    {
        private int _id;
        private string _omschrijving;
        private string _gebruiker;
        private DateTime _dtmGemaakt;

        public Antwoord(int pID, string pOmschrijving, string pGebruiker, DateTime pdtmGemaakt)
        {
            _id = pID;
            _gebruiker = pGebruiker;
            _omschrijving = pOmschrijving;
            _dtmGemaakt = pdtmGemaakt;
        }

        public int Id { get => _id; set => _id = value; }
        public string Gebruiker { get => _gebruiker; set => _gebruiker = value; }
        public string Omschrijving { get => _omschrijving; set => _omschrijving = value; }
        public DateTime DtmGemaakt { get => _dtmGemaakt; set => _dtmGemaakt = value; }

        public override string ToString()
        {
            return _id + " - op " + _dtmGemaakt.ToShortDateString() + " zei " + _gebruiker + " : " + _omschrijving;
        }
    }
}
