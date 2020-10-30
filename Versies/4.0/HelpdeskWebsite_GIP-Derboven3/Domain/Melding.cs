using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Melding
    {
        private int _id;
        private string _omschrijving;
        private DateTime _dtmGemaakt;

        public Melding() { }
        //Constructor
        public Melding(int pid, string pomschrijving, DateTime pdtmGemaakt)
        {
            _id = pid;
            _omschrijving = pomschrijving;
            _dtmGemaakt = pdtmGemaakt;
        }

        public int Id { get => _id; set => _id = value; }
        public string Omschrijving { get => _omschrijving; set => _omschrijving = value; }
        public DateTime DtmGemaakt { get => _dtmGemaakt; set => _dtmGemaakt = value; }


        //ToString() functie
        public override string ToString()
        {
            return "x";
        }
    }
}
