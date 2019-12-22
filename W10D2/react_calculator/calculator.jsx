import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        // your code here
        this.state = {
            result: 0,
            num1: "",
            num2: ""
        }

        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);   
        this.setResult = this.setResult.bind(this);
        this.clear = this.clear.bind(this);     

    }
    setNum1(e) {
        e.preventDefault();
        this.setState({num1: e.currentTarget.value});
    }

    setNum2(e) {
        e.preventDefault();
        this.setState({num2: e.currentTarget.value});
    }

    setResult(e) {
        e.preventDefault();
        let newResult = 0;
        let num1 = parseInt(this.state.num1);
        let num2 = parseInt(this.state.num2);

        switch(e.currentTarget.id) {
            case "add":
                newResult = num1 + num2;
                break;
            case "subtract":
                newResult = num1 - num2;
                break;
            case "multiply":
                newResult = num1 * num2;
                break;
            case "divide":
                newResult = num1 / num2;
                break;
            default:
                break;
        }
        this.setState({result: newResult});
    }

    clear(e) {
        e.preventDefault();
        this.setState({num1: "", num2: ""});        
    }

    render() {
        const { num1, num2 } = this.state;
        return (
            <div>
                <h1>{this.state.result}</h1>
                <br />
                <input type="text" onChange={this.setNum1} value={num1} />
                <input type="text" onChange={this.setNum2} value={num2} />
                <button id="clear" onClick={this.clear}>Clear</button>
                <br />
                <button id="add" onClick={this.setResult}>+</button>
                <button id="subtract" onClick={this.setResult}>-</button>
                <button id="multiply" onClick={this.setResult}>*</button>
                <button id="divide" onClick={this.setResult}>/</button>
            </div>
        );
    }
}

export default Calculator;