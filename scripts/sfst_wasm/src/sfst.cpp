/*******************************************************************/
/*                                                                 */
/*  FILE     sfst.cpp                                              */
/*  MODULE   sfst                                                  */
/*  PROGRAM  SFST                                                  */
/*  AUTHOR   Ashvin Ranjan                                         */
/*                                                                 */
/*******************************************************************/

#include "fst.h"

using namespace SFST;

static Transducer transducer;

extern "C"
{
  int main()
  {
    FILE *file;
    if ((file = fopen("./data/data.a", "rb")) == NULL)
    {
      exit(1);
    }
    try
    {
      Transducer a(file);
      transducer = a.copy();
      fclose(file);
    }
    catch (const char *p)
    {
      std::cerr << p << "\n";
      return 1;
    }
  }

  void analyze(char *string)
  {
    transducer.analyze_string(string, stdout, true);
  }

  void generate(char *string)
  {
    transducer.generate_string(string, stdout, true);
  }
}