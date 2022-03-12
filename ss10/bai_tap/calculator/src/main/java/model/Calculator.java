package model;

public class Calculator {
    public static float calculate(float firtsOperand, float secondOperand ,char operator){
        switch (operator){
            case '+':
                return firtsOperand + secondOperand ;
            case '-':
                return firtsOperand - secondOperand ;
            case '*':
                return firtsOperand * secondOperand ;
            case '/' :
                if(secondOperand != 0)
                    return firtsOperand / secondOperand;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
