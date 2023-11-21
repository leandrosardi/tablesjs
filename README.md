# Tables.js

The **Tables.Js** is a JavaScript library allows you to draw HTML tables with edition capabilities. 

1. Installation
2. Draw a First Table
3. Adding Rows
4. Getting Row Count
5. Removing Rows
6. Getting Cell Value
7. Setting Focus on a Cell
8. Catching Events
9. Custom Cells

## 1. Installation

```html
<script src="https://connectionsphere.com/javascripts/tablesjs/tables.min.js" type="text/javascript"></script>
```

## 2. Draw a First Table

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

## 3. Adding Rows

```javascript
tablesJs.add(ctx);
```

## 4. Getting Row Count

```javascript
tablesJs.count(ctx);
// => return an integer
```

## 5. Removing Rows

```javascript
tablesJs.remove(ctx, 0);
// removes the first row
```

```javascript
tablesJs.remove(ctx, tablesJs.count(ctx)-1);
// removes the last row
```

## 6. Cell Value

You can get a cell value,

```javascript
rownum = 0;
colnum = 0;
url = tablesJs.get_value(ctx, rownum, colnum);
// => return a string
```

and you can set the velue of any cell too:

```javascript
rownum = 0;
colnum = 0;
url = 'https://freeleadsdata.com';
tablesJs.get_value(ctx, rownum, colnum, url);
```

## 7. Cell Color

You can get the border color of a cell,

```javascript
rownum = 0;
colnum = 0;
color = tablesJs.get_color(ctx, rownum, colnum);
// => return a string
```

and you can set the border color of any cell too:

```javascript
rownum = 0;
colnum = 0;
color = 'green';
tablesJs.get_value(ctx, rownum, colnum, color);
```

## 8. Setting Focus on a Cell

```javascript
rownum = 0;
colnum = 0;
tablesJs.focus(ctx, rownum, colnum);
// => set focus on the input field inside the cell
```

## 9. Events Handling

You can define a callback function for 2 events:

1. `on_edit_cell`, and
2. `on_remove_row`.

Here is a code to define a table with a callback function for the `on_edit_cell` event.

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
            ],

            // This functions is called just after a new cell (td) is created.
            // Attributes:
            // - rownum: number of the row, starting from 0.
            // - colnum: number of the column, starting from 0.
            // - td: is the DOM element.
            on_edit_cell: function(rownum, colnum, s) {
                // validate the the value of the cell (rownum, colnum) in the table inside ctx.
            },
        });
    });
</script>
```

The callback function for the `on_remove_row` event is similar.

```javascript
			on_remove_row: function(rownum) {
				// trace log
				console.log('REMOVE');
				console.log('rownum: '+rownum);
				$('#myTableValues').val( 'REMOVE row ' + rownum.toString() );
			},
```

## 9. Column Types

Each column can manage 4 different types:

1. `type: 'text'`,
2. `type: 'number'`,
3. `type: 'date'`,
4. `type: 'time'`,

## 10. Using Tables.js as a [MySaaS](https://github.com/leandrosardi/my.saas) Extension

If you are running a [MySaaS](https://github.com/leandrosardi/my.saas) project, you can add **Tables.js** as an extension.

Such an extension includes a code example screen (/tablesjs) that you show to other developers, for reference.

Install Tables.js as an extension of MySaaS is pretty simple.

**Step 1:** Clone the project in the extensions folder.

```bash
cd ~/code/mysaas/extensions
git clone https://github.com/leandrosardi/tablesjs
```

**Step 2:** Add the extension to your `config.rb` file.

```ruby
BlackStack::Extensions.append :tablesjs
```

## Further Work

1. Add support for currency cell type.

2. Define read-only columns.

3. Set/Get read-only status of any cell.

4. Add row-selection support.

5. Swtich a cell to editable by clicking a pencil icon, like happens in [Editables.js](https://github.com/leandrosardi/editablesjs)

6. Add custom buttons to each row.

7. Add custom drop-down menu to each row.

8. Catching support for cell focus event.

## Disclaimer

Use at your own risk. The use of the software and scripts downloaded on this site is done at your own discretion and risk and with agreement that you will be solely responsible for any damage to any computer system or loss of data that results from such activities.

## Maintainer

Leandro Daniel Sardi <leandro((@))connectionsphere.com>


