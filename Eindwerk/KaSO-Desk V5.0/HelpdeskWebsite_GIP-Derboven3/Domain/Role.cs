using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Role
    {
        private int _id;
        private string _groep;

        public Role(int pID, string pGroep)
        {
            _id = pID;
            _groep = pGroep;
        }

        public int Id { get => _id; set => _id = value; }
        public string Groep { get => _groep; set => _groep = value; }
    }
}
