const Error_enumobj = {
    FP_ROUNDING: "FP_ROUNDING",
    FP_OVERFLOW: "FP_OVERFLOW",
    FP_UNDERFLOW: "FP_UNDERFLOW",
    INT_OVERFLOW: "INT_OVERFLOW"
};

const Result_enumobj = {
    A_BIT_DIFFERENT: "A_BIT_DIFFERENT",
    INFINITY: "INFINITY",
    ZERO: "ZERO",
    VERY_DIFFERENT: "VERY_DIFFERENT"
};

function error2Result(err) {
    switch (err) {
        case Error_enumobj.FP_ROUNDING:
            return Result_enumobj.A_BIT_DIFFERENT;
        case Error_enumobj.FP_OVERFLOW:
            return Result_enumobj.INFINITY;
        case Error_enumobj.FP_UNDERFLOW:
            return Result_enumobj.ZERO;
        case Error_enumobj.INT_OVERFLOW:
            return Result_enumobj.VERY_DIFFERENT;
        default:
            return null;
    }
}

function result2Error(result) {
    switch (result) {
        case Result_enumobj.A_BIT_DIFFERENT:
            return Error_enumobj.FP_ROUNDING;
        case Result_enumobj.INFINITY:
            return Error_enumobj.FP_OVERFLOW;
        case Result_enumobj.ZERO:
            return Error_enumobj.FP_UNDERFLOW;
        case Result_enumobj.VERY_DIFFERENT:
            return Error_enumobj.INT_OVERFLOW;
        default:
            return null;
    }
}

// Display known errors and results
console.log("Error list:", Object.values(Error_enumobj));
console.log("Result list:", Object.values(Result_enumobj));

// Example usage
let input = "FP_OVERFLOW"; // Change this to test different cases
if (Object.values(Error_enumobj).includes(input)) {
    let result = error2Result(input);
    console.log(input + " results in " + result);
} else if (Object.values(Result_enumobj).includes(input)) {
    let err = result2Error(input);
    console.log(input + " results from " + err);
} else {
    console.log("Invalid input");
}
