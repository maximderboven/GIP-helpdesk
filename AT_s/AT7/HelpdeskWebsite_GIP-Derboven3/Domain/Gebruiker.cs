using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Gebruiker
    {
        private int _id;
        private string _naam;
        private string _email;
        private string _groep;
        private bool _actief;
        private DateTime _dtmAangemaakt;

        //Constructor
        public Gebruiker(int pid, string pnaam, string pemail, string pgroep, bool pactief, DateTime pdtmaangemaakt)
        {
            _id = pid;
            _naam = pnaam;
            _email = pemail;
            _groep = pgroep;
            _actief = pactief;
            _dtmAangemaakt = pdtmaangemaakt;
        }

        public int Id { get => _id; set => _id = value; }
        public string Naam { get => _naam; set => _naam = value; }
        public string Email { get => _email; set => _email = value; }
        public string Groep { get => _groep; set => _groep = value; }
        public bool Actief { get => _actief; set => _actief = value; }
        public DateTime DtmAangemaakt { get => _dtmAangemaakt; set => _dtmAangemaakt = value; }


        //ToString() functie
        public override string ToString()
        {
            return "x";
        }
    }
}
