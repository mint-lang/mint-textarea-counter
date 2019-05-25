component Textarea.Counter {
  property onChange : Function(String, a) = (value : String) : Void { void }
  property value : String = ""

  style base {
    border: 1px solid #DDD;

    flex-direction: column;
    display: inline-flex;
  }

  style textarea {
    font-family: sans-serif;
    font-size: 16px;

    padding: 10px;
    margin: 0;
    border: 0;
  }

  style counter {
    font-family: sans-serif;
    background: #EEE;
    font-size: 14px;
    padding: 10px;
  }

  fun handleChange (event : Html.Event) : a {
    event.target
    |> Dom.getValue()
    |> onChange()
  }

  fun render : Html {
    <div::base>
      <div::counter>
        "Character Count: "

        <{
          value
          |> String.size()
          |> Number.toString()
        }>
      </div>

      <textarea::textarea
        onChange={handleChange}
        value={value}/>
    </div>
  }
}
