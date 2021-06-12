# Tables.js

The **Tables.Js** is a JavaScript library allows you to draw HTML tables, with 

- in-cell edition, and 

- dynamic rows adding/removing.

*(pending)* You can find a [live example](https://connectionsphere.com/developers/tablesjs) of **Tables.Js** here: [https://connectionsphere.com/developers/tablesjs](https://connectionsphere.com/developers/tablesjs)

# 1. Getting Started
Get started in 3 simple steps.

1. Download the required libraries and stylesheets.
All these files are included in this project. You can download them from this page.

2. Include them in the <header> section of your HTML page.

```html
<script src="jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="commons.js" type="text/javascript"></script>
<link rel="stylesheet" href="./templates.css">
<script src="./tables.min.js" type="text/javascript"></script>
```

3. Create the progress bar.

```html
<div id='myTable'></div>
<script>
    var ctx = document.getElementById('myTable');
    $(document).ready(function() {
        tablesJs.draw(ctx, {
            rows: 1,
            class: 'my_table_style', // Assign a custom value to the class atribute of the table.
            remove_row_button: true, // Add a "remove" button at the right side of each row. This is false by default.
            row_height: '50px', // This value will be added in the CSS heigh attribute of the row (tr).
            header: [
                {
                    id: 'url',
                    width: '400px', // This value will be added in the CSS width attribute of the column (th).
                    text: 'url', // Name of the column, in the header (th).
                    type: 'text', // It can be 'text', 'number' or 'list'.
                    placeholder: 'write an URL here', // Placeholder attribute of the input field. It is null by default.
                    value: '', // Default value for cells (td).
                    select_all: true, // Select all text on focus. It is false by default. 
                },
                { id: 'min_minutes', width: '100px', text: 'min. minutes', type: 'int', value: 10 },
                { id: 'max_minutes', width: '100px', text: 'max. minutes', type: 'int', value: 5 },
            ],
        });
    });
</script>
```

*(pending to add screesnhot here)*

# 1. Adding Rows

```javascript
tablesJs.add(ctx);
```

# 2. Getting Row Count

```javascript
tablesJs.row_count(ctx);
// => return an integer
```

# 3. Removing Rows

```javascript
tablesJs.remove(ctx, 0);
// removes the first row
```

```javascript
tablesJs.remove(ctx, tablesJs.row_count(ctx)-1);
// removes the last row
```

# 4. Getting Cell Value

```javascript
tablesJs.value(ctx, rownum, colnum);
// => return an integer
```

# 5. Setting Focus on a Cell

```javascript
tablesJs.focus(ctx, rownum, colnum);
// => set focus on the input field inside the cell
```


# 6. Catching Events

*(this feature is pending for development)*

```html
<div id='myTable'></div>
<script>
    var ctx = document.getElementById('myTable');
    $(document).ready(function() {
        tablesJs.draw(ctx, {
            rows: 1,
            remove_row_button: true, // Add a "remove" button at the right side of each row. This is false by default.
            row_height: '50px', // this value will be added in the CSS heigh attribute of the row (tr).
            header: [
                {
                    id: 'url',
                    width: '400px', // this value will be added in the CSS width attribute of the column (th).
                    text: 'url', // name of the column, in the header (th).
                    type: 'text', // it can be 'text', 'number' or 'list'.
                    placeholder: 'write an URL here', // placeholder attribute of the input field. It is null by default.
                    value: '', // default value for cells (td).
                },
                { id: 'min_minutes', width: '100px', text: 'min. minutes', type: 'int', value: 10 },
                { id: 'max_minutes', width: '100px', text: 'max. minutes', type: 'int', value: 5 },
            ],

            // This functions is called just after a new cell (td) is created.
            // Attributes:
            // - rownum: number of the row, starting from 0.
            // - colnum: number of the column, starting from 0.
            // - td: is the DOM element.
            on_field_update: function(rownum, colnum, td) {
                // validate the the value of the cell (rownum, colnum) in the table inside ctx.
            },
        });
    });
</script>
```

# 7. Custom Cells

*(this feature is pending for development)*

You can add a custom HTML DOM inside a cell in order to add any kind of editable field that is not supported natively; like date, time, dropdown list, float. 

```html
<div id='myTable'></div>
<script>
    var ctx = document.getElementById('myTable');
    $(document).ready(function() {
        tablesJs.draw(ctx, {
            rows: 1,
            remove_row_button: true, // Add a "remove" button at the right side of each row. This is false by default.
            row_height: '50px', // this value will be added in the CSS heigh attribute of the row (tr).
            header: [
                {
                    id: 'url',
                    width: '400px', // this value will be added in the CSS width attribute of the column (th).
                    text: 'url', // name of the column, in the header (th).
                    type: 'text', // it can be 'text', 'number' or 'list'.
                    placeholder: 'write an URL here', // placeholder attribute of the input field. It is null by default.
                    value: '', // default value for cells (td).
                },
                { id: 'min_minutes', width: '100px', text: 'min. minutes', type: 'int', value: 10 },
                { id: 'max_minutes', width: '100px', text: 'max. minutes', type: 'int', value: 5 },
            ],

            // This functions is called just after a new cell (td) is created.
            // Attributes:
            // - rownum: number of the row, starting from 0.
            // - colnum: number of the column, starting from 0.
            // - td: is the DOM element.
            on_cell_created: function(rownum, colnum, td) {
                if ( rownum == 0 ) { // url
                    // create a textfield inside this td
                    var o = document.createElement("input");
                    o.setAttribute(id, td.getAttribute('id')+'-input');
                    o.addEventListener("keyup", function() {  
                        // validate the the value of the cell (rownum, colnum) in the table inside ctx.
                    });
                    td.appendChild(o);
            },
        });
    });
</script>
```

# Further Work

1. Native support editable cells for other data types: date, time, dropdown list, float. 

2. Swtich a cell to editable by clicking a pencil icon, like happens in [Editables.js](https://github.com/leandrosardi/editablesjs)

3. Add custom buttons to each row.

4. Add custom drop-down menu to each row.

5. Catching custom events in text-fields like focus and keyup.

6. Define protocol to add custom cell, and still be able to operate with all the features of tablesJs.

# Additional Notes
The **Tables.Js** is used at [**ExpandedVenture**](https://expandedventure.com/expandedventure) to develop different UI/UX features.

The **Tables.Js** library is just starting on Jun-2021, and more functions will be added as needed.

The **Tables.Js** library has been written following the [**W3C JavaScript Best Practices**](https://www.w3.org/community/webed/wiki/JavaScript_best_practices).

# Disclaimer
Use at your own risk. The use of the software and scripts downloaded on this site is done at your own discretion and risk and with agreement that you will be solely responsible for any damage to any computer system or loss of data that results from such activities.

# Maintainer
Leandro Daniel Sardi <leandro((dot))sardi((@))expandedventure.com>


