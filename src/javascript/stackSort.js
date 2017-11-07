var stackSort = function(stack){
    var result = [];
    var resultMine ,tmp = null;
    while(!isNaN(tmp = stack.pop())){
        if (isNaN(resultMine))
            resultMine = tmp;
        if(tmp >= resultMine){
            var camper = null;
            while ((camper = result.pop()) < tmp){
                stack.push(camper);
            }
            if(!isNaN(camper))
                result.push(camper);
        }
        result.push(tmp);
        resultMine = tmp;
    }
    return result;
}
