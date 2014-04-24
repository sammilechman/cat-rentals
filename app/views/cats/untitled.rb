h1> New Cat on the block. </h1>

<form action= <%= cats_url %> method="POST">
  <p>
    <label for="name_input"> Name: </label>
    <input type="text" name="cat[name]" id="name_input">
    <label for= "age_input"> Age: </label>
    <input type="text" name="cat[age]" id="age_input">
    <br>
  </p>
  <p>
    <label> Choose Sex: </label>
    <label for= "gender_male"> M </label>
    <input id="gender_male" name="cat[sex]" type="radio" value="M" />
    <label for= "gender_female"> F </label>
    <input id="gender_female" name="cat[sex]" type="radio" value="F" />
    <br>
  </p>
  <p>
    <label for="cat_color">Eye Color: </label>
    <select name="cat[color]" id="cat_color">
      <!-- `Nothing.`, if selected, is the value that will be submitted to
        the server; user is displayed "Nothing." as the choice -->
        <option>Please choose...</option>
        <option value="brown">Brown</option>
        <option value="black">Black</option>
        <option value="blue">Blue</option>

      </select>
    </p>
    <p>
      <label for="cat_birth_date">Birth date:</label>
      <!-- click on the date will launch a date picker -->
      <input name="cat[birth_date]" id="cat_birth_date" type="date"></input>


    </p>
    <p>
      <input type="submit" value="Create cat">

    </p>
  </form>