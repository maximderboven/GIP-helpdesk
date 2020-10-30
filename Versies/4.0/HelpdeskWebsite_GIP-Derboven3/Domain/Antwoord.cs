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
        private DateTime _datumGemaakt;

        //Constructor
        public Antwoord(int pid, string pomschrijving, string pgebruiker, DateTime pdatumgemaakt)
        {
            _id = pid;
            _gebruiker = pgebruiker;
            _omschrijving = pomschrijving;
            _datumGemaakt = pdatumgemaakt;
        }

        public int Id { get => _id; set => _id = value; }
        public string Gebruiker { get => _gebruiker; set => _gebruiker = value; }
        public DateTime DatumGemaakt { get => _datumGemaakt; set => _datumGemaakt = value; }
        public string Omschrijving { get => _omschrijving; set => _omschrijving = value; }


        //ToString() functie
        public override string ToString()
        {
            return _id + " - op " + _datumGemaakt.ToShortDateString() + " zei " + _gebruiker + " : " + _omschrijving;
        }
    }
}
