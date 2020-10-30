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

        //Constructor
        public Role(int pid, string pgroep)
        {
            _id = pid;
            _groep = pgroep;
        }

        public int Id { get => _id; set => _id = value; }
        public string Groep { get => _groep; set => _groep = value; }
    }
}
