Table data;

void setup() {

  data = loadTable("T4q7.csv", "csv");

  int maleCount = 0;
  int femaleCount = 0;
  int bornAfter2003 = 0;

  for (int i = 1; i < data.getRowCount(); i++) {   // start from row 1 (skip first line)

    TableRow row = data.getRow(i);

    String gender = row.getString(4);   // column 4 = Gender
    int birthYear = row.getInt(5);      // column 5 = Year of Birth

    if (gender.equals("Male")) {
      maleCount++;
    } 
    else if (gender.equals("Female")) {
      femaleCount++;
    }

    if (birthYear > 2003) {
      bornAfter2003++;
    }
  }

  println("Number of males: " + maleCount);
  println("Number of females: " + femaleCount);
  println("Born after 2003: " + bornAfter2003);
}
