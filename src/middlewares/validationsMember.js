const validationMemberId = (req, res, next) => {
  const { id } = req.params;

  const idAsNumber = Number(id);
  if (Number.isNaN(idAsNumber)) {
    return res.status(400).send({ message: 'Id inválido!! Precisa ser um Número' })
  } else if (!idAsNumber) {
    return res.status(400).send({ message: 'Number not Exist' })
  } else {
    return next();
  }
}


const validationData = (req, res, next) => {
  const requireProperties = [
    'name', 'baptism', 'birth', 'country',
    'state', 'city', 'district', 'mother', 'dad', 'status'];
  if (requireProperties.every((element) => element in req.body)) {
    return next();
  } else {
    res.status(400).send({
      message:
        'Os membros precisa receber todos atributos name, baptism, birth, country, state, city, district, mother, dad, status'
    })
  }
}

module.exports = {
  validationMemberId,
  validationData,

}
