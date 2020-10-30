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
        private DateTime _dtmgeregistreerd;

        public Gebruiker() { }

        public Gebruiker(int pID, string pNaam, string pEmail, string pGroep, bool pActief, DateTime pdtmGeregistreerd) {
            _id = pID;
            _naam = pNaam;
            _email = pEmail;
            _groep = pGroep;
            _actief = pActief;
            _dtmgeregistreerd = pdtmGeregistreerd;
        }

        public int Id { get => _id; set => _id = value; }
        public string Naam { get => _naam; set => _naam = value; }
        public string Email { get => _email; set => _email = value; }
        public string Groep { get => _groep; set => _groep = value; }
        public bool Actief { get => _actief; set => _actief = value; }
        public DateTime Dtmgeregistreerd { get => _dtmgeregistreerd; set => _dtmgeregistreerd = value; }

    }
}
