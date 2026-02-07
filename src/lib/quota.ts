import axios from "axios";

const checQuota = async (): Promise<void> => {
    const response = await axios.get("https://api.github.com/rate_limit")
    console.log(response.data)
}

checQuota()